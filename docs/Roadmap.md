# Roadmap

Below is the tentative schedule for the API. 

### Beta Release 1 - April 2020
- `/tracking_requests` endpoint
- `/shipments` endpoint
- `/webhooks` endpoint
- Webhook events:
  - `shipment.eta_changed`
  - `shipment.vessel_arrived`
  - `tracking_request.succeeded` 
  - `tracking_request.failed` 

### Beta Release 2 - May 2020
- `/containers` endpoint.
- Webhook events:
  - `container.transport.vessel_arrived`
  - `container.transport.discharged`
  - `container.transport.full_out`
  - `container.transport.empty_returned`
  
### Beta Release 3 - June 2020
- New container attributes:
  - `pod_terminal_holds`
  - `pod_terminal_fees`
- Webhook events:
  - `container.updated`
  - `container.transport.vessel_loaded`
  - `container.transport.vessel_departed`

### Beta Release 4
- Webhook events:
  - `shipment.etd_changed`
  - `container.transport.transshipment_arrived`
  - `container.transport.transhipment_departed`
  - `container.transport.empty_out`
  - `container.transport.full_in`
  - `container.transport.transshipment_discharged`
  - `container.transport.transhipment_loaded`