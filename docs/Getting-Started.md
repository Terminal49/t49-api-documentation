# Getting-Started

## Tracking flow

Tracking a new shipment with Terminal 49 is an asynchronous flow. Submit your tracking request to us and we will return a tracking request id so you can see the status of your request.

We recommend your register a webhook URL with us that we will call once we have processed the request.

When we successfully lookup the BOL with the carrier we will return the newly created shipment with all of the details. 

If we encounter a problem we'll return the error.

![Tracking Request Diagram](https://www.terminal49.com/api/docs/assets/images/create-shipment-flow.png  "Tracking Request Diagram")

## Authentication

To get your API token to Terminal 49 and go to your [account API settings](https://app.terminal49.com/settings/api)

The token should be sent with each API request in the Authentication header:

```
Authentication: Token YOUR_API_TOKEN
```