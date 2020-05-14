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
  - `container.transport.vessel_discharged`
  - `container.transport.full_out`
  - `container.transport.empty_returned`

### Beta Release 3
- Webhook events:
  - `container.created`
  - `container.lfd_added`
  - `container.available_for_pickup`
  - `container.hold_added`
  - `container.hold_released`
  - `container.fee_added`
  - `container.fee_paid`
  - `container.unavailable_for_pickup`
  - `container.yard_position_changed`
  - `container.moved_offdock`

### Beta Release 4
- Webhook events:
  - `shipment.etd_changed`
  - `shipment.vessel_departed`
  - `shipment.transshipment_arrived`
  - `shipment.transhipment_departed`
  - `container.empty_out`
  - `container.full_in`
  - `container.vessel_loaded`
  - `container.transshipment_discharged`
  - `container.transhipment_loaded`
  - `container.vessel_discharged` 