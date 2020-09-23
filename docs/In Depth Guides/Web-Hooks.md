# Webhooks

## Creating Webhooks
You may subscribe to events through webhooks to be alerted as to when events are triggered. 

You may subscribe to all webhooks by subscribing to `*`. Specific webhooks by specifying the full name of the event. e.g. `container.transport.vessel_arrived`. Or even all webhooks related to a specific model. E.g. `tracking_request.*`

See the webhooks [post endpoint](/docs/api/reference/terminal49/terminal49.json/paths/~1webhooks/post) for details on adding a webhooks.


## Receiving Webhooks

When an event is triggered we will attempt to post to the URL you provided with the webhook.

The payload of every webhook is a `webhook_notification`. Each Webhook notification includes a `reference_object` in it's relationships which is the subject of that notification (e.g. a tracking request, or an updated container).

```json json_schema
{
  "type":"object",
  "properties":{
    "data":{
      "type": "object",
      "properties": {
        "id": {
          "type": "string",
          "format": "uuid"
        },
        "type": {
          "type": "string",
          "enum": [
            "webhook_notification"
          ]
        },
        "attributes": {
          "type": "object",
          "properties": {
            "event": {
              "type": "string"
            },
            "delivery_status": {
              "type": "string",
              "default": "pending",
              "enum": [
                "pending",
                "succeeded",
                "failed"
              ],
              "description": "Whether the notification has been delivered to the webhook endpoint"
            },
            "created_at": {
              "type": "string"
            }
          },
          "required": [
            "event",
            "delivery_status",
            "created_at"
          ]
        },
        "relationships": {
          "type": "object",
          "properties": {
            "webhook": {
              "type": "object",
              "properties": {
                "data": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "format": "uuid"
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "webhook"
                      ]
                    }
                  }
                }
              }
            },
            "reference_object": {
              "type": "object",
              "properties": {
                "data": {
                  "type": "object",
                  "properties": {
                    "id": {
                      "type": "string",
                      "format": "uuid"
                    },
                    "type": {
                      "type": "string",
                      "enum": [
                        "tracking_request",
                        "estimated_event",
                        "transport_event",
                        "container_updated_event"
                      ]
                    }
                  }
                }
              }
            }
          },
          "required": [
            "webhook"
          ]
        }
      }
    },
    "included":{
      "type":"array",
      "items": {
        "anyOf": [
          {
            "type": "object",
            "title": "Webhook",
          },
          {
            "type": "object",
            "title": "Tracking Request",
          },
          {
            "type": "object",
            "title": "Transport Event",
          },
          {
            "type": "object",
            "title": "Estimated Event",
          },
          {
            "type": "object",
            "title": "Container Updated Event",
          },
          {
            "type": "object",
            "title": "Terminal",
          },
           {
            "type": "object",
            "title": "Port",
          },
          
        ]
      }
    }

  }
}
```

## Events

Each event represents some change to a model which you may be notified of. These events are supported:

- container.updated
- container.transport.vessel_loaded
- container.transport.vessel_departed
- container.transport.vessel_arrived
- container.transport.vessel_discharged
- container.transport.full_out
- container.transport.empty_in
- shipment.estimated.arrival
- tracking_request.succeeded
- tracking_request.failed



### container.updated

The container updated event lets you know about changes to container properties at the terminal, or which terminal the container is (or will be) located at.

The `changeset` attribute on is a hash of all the properties which changed on the container.
Below are some payload examples with notes.

Each changed property is the hash key. The prior value is the first item in the array, and the current value is the second item in the array. 

For example:
```
"changeset": {
  "pickup_lfd": [null, "2020-05-20 00:00:00"]
}
```
Shows that the pickup last free day has changed from not being set to May 20 2020.

The properties we show changes for are:
- fees_at_pod_terminal
- holds_at_pod_terminal
- pickup_lfd
- pickup_appointment_at
- available_for_pickup
- pod_terminal



<!--
type: tab
title: POD Terminal
-->
The pod_terminal is a relationship of the container. When the pod_terminal changes the id is included. The terminal will be serialized in the included models.

N.B. the `container_updated_event` also has a relationship to a `terminal` which refers to where the information came from. Currently this is always the POD terminal. In the future this may be the final destination terminal.
```json
{
  "data": {
    "id": "7f0da45a-05e4-410e-b30b-75bbfa1bae1e",
    "type": "webhook_notification",
    "attributes": {
      "id": "7f0da45a-05e4-410e-b30b-75bbfa1bae1e",
      "event": "container.updated",
      "delivery_status": "pending",
      "created_at": "2020-06-26T23:30:01Z"
    },
    "relationships": {
      "reference_object": {
        "data": {
          "id": "2356a80e-d57c-441e-89e7-9a580576f668",
          "type": "container_updated_event"
        }
      },
      "webhook": {
        "data": {
          "id": "6b4565c6-9d4a-49e6-987f-e8d9249697df",
          "type": "webhook"
        }
      },
      "webhook_notification_logs": {
        "data": []
      }
    }
  },
  "included": [
    {
      "id": "2356a80e-d57c-441e-89e7-9a580576f668",
      "type": "container_updated_event",
      "attributes": {
        "changeset": {
          "pod_terminal": [
            null,
            "39613037-1dcd-4b82-bac1-a00ad6a5f972"
          ]
        },
        "timestamp": "2020-06-26T23:30:01Z",
        "timezone": "America/Los_Angeles"
      },
      "relationships": {
        "container": {
          "data": {
            "id": "70a07a7d-9a09-455e-ad9f-dbf26aa5367d",
            "type": "container"
          }
        },
        "terminal": {
          "data": {
            "id": "39613037-1dcd-4b82-bac1-a00ad6a5f972",
            "type": "terminal"
          }
        }
      }
    },
    {
      "id": "70a07a7d-9a09-455e-ad9f-dbf26aa5367d",
      "type": "container",
      "attributes": {
        "number": "TRLU1483600",
        "seal_number": "b229e75cd5a0fb49",
        "created_at": "2020-06-26T23:30:01Z",
        "equipment_type": "dry",
        "equipment_length": 40,
        "equipment_height": "standard",
        "weight_in_lbs": 47544,
        "fees_at_pod_terminal": [],
        "holds_at_pod_terminal": [],
        "pickup_lfd": null,
        "availability_known": true,
        "available_for_pickup": null,
        "pod_arrived_at": "2020-06-26T23:30:01Z",
        "pod_discharged_at": "2020-06-26T23:30:01Z",
        "final_destination_full_out_at": "2020-06-26T23:30:01Z",
        "pod_full_out_at": null,
        "empty_terminated_at": null
      },
      "relationships": {
        "shipment": {
          "data": {
            "id": "9e788708-c43d-4af9-9deb-890cc49e852a",
            "type": "shipment"
          }
        },
        "pod_terminal": {
          "data": {
            "id": "39613037-1dcd-4b82-bac1-a00ad6a5f972",
            "type": "terminal"
          }
        }
      }
    },
    {
      "id": "39613037-1dcd-4b82-bac1-a00ad6a5f972",
      "type": "terminal",
      "attributes": {
        "id": "39613037-1dcd-4b82-bac1-a00ad6a5f972",
        "nickname": "Bayer-Hilpert",
        "name": "Mann Group Terminal",
        "firms_code": "S787"
      },
      "relationships": {
        "port": {
          "data": {
            "id": "e9e9f38d-bf9f-455f-8862-f7067d39b29c",
            "type": "port"
          }
        }
      }
    }
  ]
}
```
<!-- type: tab-end -->


### tracking_request.succeeded

```json
{
  "data": {
    "id": "a76187fc-5749-43f9-9053-cfaad9790a31",
    "type": "webhook_notification",
    "attributes": {
      "id": "a76187fc-5749-43f9-9053-cfaad9790a31",
      "event": "tracking_request.succeeded",
      "delivery_status": "pending",
      "created_at": "2020-09-11T21:25:34Z"
    },
    "relationships": {
      "reference_object": {
        "data": {
          "id": "bdeca506-9741-4ab1-a0a7-cfd1d908e923",
          "type": "tracking_request"
        }
      },
      "webhook": {
        "data": {
          "id": "914b21ce-dd7d-4c49-8503-65aba488e9a9",
          "type": "webhook"
        }
      },
      "webhook_notification_logs": {
        "data": []
      }
    }
  },
  "included": [
    {
      "id": "bdeca506-9741-4ab1-a0a7-cfd1d908e923",
      "type": "tracking_request",
      "attributes": {
        "request_number": "TE497ED1063E",
        "request_type": "bill_of_lading",
        "scac": "MSCU",
        "ref_numbers": [],
        "created_at": "2020-09-11T21:25:34Z",
        "status": "created",
        "failed_reason": null,
        "is_retrying": false,
        "retry_count": null
      },
      "relationships": {
        "tracked_object": {
          "data": {
            "id": "b5b10c0a-8d18-46da-b4c2-4e5fa790e7da",
            "type": "shipment"
          }
        }
      },
      "links": {
        "self": "/v2/tracking_requests/bdeca506-9741-4ab1-a0a7-cfd1d908e923"
      }
    },
    {
      "id": "b5b10c0a-8d18-46da-b4c2-4e5fa790e7da",
      "type": "shipment",
      "attributes": {
        "created_at": "2020-09-11T21:25:33Z",
        "bill_of_lading_number": "TE497ED1063E",
        "ref_numbers": [],
        "shipping_line_scac": "MSCU",
        "shipping_line_name": "Mediterranean Shipping Company",
        "port_of_lading_locode": "MXZLO",
        "port_of_lading_name": "Manzanillo",
        "port_of_discharge_locode": "USOAK",
        "port_of_discharge_name": "Port of Oakland",
        "pod_vessel_name": "MSC CHANNE",
        "pod_vessel_imo": "9710438",
        "pod_voyage_number": "098N",
        "destination_locode": null,
        "destination_name": null,
        "destination_timezone": null,
        "destination_ata_at": null,
        "destination_eta_at": null,
        "pol_etd_at": null,
        "pol_atd_at": "2020-08-29T21:25:33Z",
        "pol_timezone": "America/Mexico_City",
        "pod_eta_at": "2020-09-18T21:25:33Z",
        "pod_ata_at": null,
        "pod_timezone": "America/Los_Angeles"
      },
      "relationships": {
        "port_of_lading": {
          "data": {
            "id": "4384d6a5-5ccc-43b7-8d19-4a9525e74c08",
            "type": "port"
          }
        },
        "port_of_discharge": {
          "data": {
            "id": "2a765fdd-c479-4345-b71d-c4ef839952e2",
            "type": "port"
          }
        },
        "pod_terminal": {
          "data": {
            "id": "17891bc8-52da-40bf-8ff0-0247ec05faf1",
            "type": "terminal"
          }
        },
        "destination": {
          "data": null
        },
        "containers": {
          "data": [
            {
              "id": "b2fc728c-e2f5-4a99-8899-eb7b34ef22d7",
              "type": "container"
            }
          ]
        }
      },
      "links": {
        "self": "/v2/shipments/b5b10c0a-8d18-46da-b4c2-4e5fa790e7da"
      }
    },
    {
      "id": "b2fc728c-e2f5-4a99-8899-eb7b34ef22d7",
      "type": "container",
      "attributes": {
        "number": "ARDU1824900",
        "seal_number": "139F1451",
        "created_at": "2020-09-11T21:25:34Z",
        "equipment_type": "dry",
        "equipment_length": 40,
        "equipment_height": "standard",
        "weight_in_lbs": 53507,
        "fees_at_pod_terminal": [],
        "holds_at_pod_terminal": [],
        "pickup_lfd": null,
        "pickup_appointment_at": null,
        "availability_known": true,
        "available_for_pickup": false,
        "pod_arrived_at": null,
        "pod_discharged_at": null,
        "final_destination_full_out_at": null,
        "pod_full_out_at": null,
        "empty_terminated_at": null
      },
      "relationships": {
        "shipment": {
          "data": {
            "id": "b5b10c0a-8d18-46da-b4c2-4e5fa790e7da",
            "type": "shipment"
          }
        },
        "pod_terminal": {
          "data": {
            "id": "17891bc8-52da-40bf-8ff0-0247ec05faf1",
            "type": "terminal"
          }
        },
        "transport_events": {
          "data": [
            {
              "id": "56078596-5293-4c84-9245-cca00a787265",
              "type": "transport_event"
            }
          ]
        }
      }
    },
    {
      "id": "56078596-5293-4c84-9245-cca00a787265",
      "type": "transport_event",
      "attributes": {
        "event": "container.transport.vessel_departed",
        "created_at": "2020-09-11T21:25:34Z",
        "voyage_number": null,
        "timestamp": "2020-08-29T21:25:33Z",
        "location_locode": "MXZLO",
        "timezone": "America/Los_Angeles"
      },
      "relationships": {
        "shipment": {
          "data": {
            "id": "b5b10c0a-8d18-46da-b4c2-4e5fa790e7da",
            "type": "shipment"
          }
        },
        "container": {
          "data": {
            "id": "b2fc728c-e2f5-4a99-8899-eb7b34ef22d7",
            "type": "container"
          }
        },
        "vessel": {
          "data": null
        },
        "location": {
          "data": {
            "id": "2a765fdd-c479-4345-b71d-c4ef839952e2",
            "type": "port"
          }
        },
        "terminal": {
          "data": null
        }
      }
    }
  ]
}
```

### shipment.estimated.arrival

```json
{
  "data": {
    "id": "d7e04138-b59d-4c41-9d2d-251d95bedd6e",
    "type": "webhook_notification",
    "attributes": {
      "id": "d7e04138-b59d-4c41-9d2d-251d95bedd6e",
      "event": "shipment.estimated.arrival",
      "delivery_status": "pending"
    },
    "relationships": {
      "reference_object": {
        "data": {
          "id": "b68bc6cb-2c37-43f6-889b-86a16b2b6fe6",
          "type": "estimated_event"
        }
      },
      "webhook": {
        "data": {
          "id": "614eab61-ae3c-4d40-bbe9-41200a172691",
          "type": "webhook"
        }
      }
    }
  },
  "included": [
    {
      "id": "b68bc6cb-2c37-43f6-889b-86a16b2b6fe6",
      "type": "estimated_event",
      "attributes": {
        "created_at": "2020-04-06T19:02:46-07:00",
        "estimated_timestamp": "2020-04-09T19:02:46-07:00",
        "voyage_number": "A1C",
        "event": "shipment.estimated.arrival",
        "timezone": "America/Los_Angeles"
      },
      "relationships": {
        "shipment": {
          "data": {
            "id": "715ed64b-6195-49f6-9407-1383a8088bfd",
            "type": "shipment"
          }
        },
        "port": {
          "data": {
            "id": "ed4001a5-ad9d-43c3-883c-79354f422510",
            "type": "port"
          }
        },
        "vessel": {
          "data": {
            "id": "ebf68c6c-9d0d-4383-aa41-e097009dfb4c",
            "type": "vessel"
          }
        }
      }
    },
    {
      "id": "ed4001a5-ad9d-43c3-883c-79354f422510",
      "type": "port",
      "attributes": {
        "id": "ed4001a5-ad9d-43c3-883c-79354f422510",
        "name": "Port of Oakland",
        "code": "USOAK",
        "state_abbr": "CA",
        "city": "Oakland",
        "country_code": "US",
        "time_zone": "America/Los_Angeles"
      }
    },
    {
      "id": "715ed64b-6195-49f6-9407-1383a8088bfd",
      "type": "shipment",
      "attributes": {
        "created_at": "2020-04-06T19:02:46-07:00",
        "bill_of_lading_number": "TE49DD6650B9",
        "ref_numbers": [
          "REF-4A25EA"
        ],
        "shipping_line_scac": "MSCU",
        "shipping_line_name": "Mediterranean Shipping Company",
        "port_of_lading_locode": "MXZLO",
        "port_of_lading_name": "Manzanillo",
        "port_of_discharge_locode": "USOAK",
        "port_of_discharge_name": "Port of Oakland",
        "pod_vessel_name": "MSC CHANNE",
        "pod_vessel_imo": "9710438",
        "pod_voyage_number": "098N",
        "destination_locode": null,
        "destination_name": null,
        "destination_timezone": null,
        "destination_ata_at": null,
        "destination_eta_at": null,
        "pol_etd_at": null,
        "pol_atd_at": null,
        "pol_timezone": "America/Mexico_City",
        "pod_eta_at": "2020-04-13T19:02:46-07:00",
        "pod_ata_at": null,
        "pod_timezone": "America/Los_Angeles"
      },
      "relationships": {
        "port_of_lading": {
          "data": {
            "id": "1378c720-efe9-4562-a2ad-562002eb4b1d",
            "type": "port"
          }
        },
        "port_of_discharge": {
          "data": {
            "id": "ed4001a5-ad9d-43c3-883c-79354f422510",
            "type": "port"
          }
        },
        "pod_terminal": {
          "data": {
            "id": "2508d879-4451-4d7f-ab23-92258b5df553",
            "type": "terminal"
          }
        },
        "destination": {
          "data": null
        },
        "containers": {
          "data": []
        }
      },
      "links": {
        "self": "/v2/shipments/715ed64b-6195-49f6-9407-1383a8088bfd"
      }
    }
  ]
}
```