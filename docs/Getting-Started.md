# Getting Started

## Tracking flow

Tracking a new shipment with Terminal 49 is an asynchronous flow. Submit your tracking request to us and we will return a tracking request id so you can see the status of your request.

We recommend your register a webhook URL with us that we will call once we have processed the request.

When we successfully lookup the BOL with the carrier we will create a shipment, and send the event `tracking_request.succeeded` to your webhook endpoint with the associated record. 

If we encounter a problem we'll send the event `tracking_request.failed`.

![Tracking Request Diagram](https://www.terminal49.com/api/docs/assets/images/create-shipment-flow.png  "Tracking Request Diagram")

If you don't want to use web hooks you can poll the `GET /tracking_request/{id}` endpoint to see the status of your request.

## Authentication

To get your API token to Terminal 49 and go to your [account API settings](https://app.terminal49.com/settings/api)

The token should be sent with each API request in the Authentication header:

```
Authentication: Token YOUR_API_TOKEN
```