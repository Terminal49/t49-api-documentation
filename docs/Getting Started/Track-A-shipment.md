# Track A Shipment

Learn how to track your first shipment


So you want to start tracking your ocean shipments and containers and you have a few BL numbers. 

[postman](https://www.postman.com/)

## 1. Get API Key
---

Sign in to your Terminal49 account and go to your [API settings](https://app.terminal49.com/settings/api) page to get your API key. 

> If you don't have an API key and you would you like to access the API during the beta period please reach out to us at [support@terminal49.com](mailto:support@terminal49.com)

## Step 2: Register a webhook

Terminal49 API is event driven. To track a shipment you have to create a tracking request. Once a tracking request is created, our system triggers events (ex: `tracking_request.succeeded` `shipment.vessel_arrived` etc). These events can be subscribed to via Webhook. This allows us to push shipment and container changes to your sysrtem instead of you having to poll for changes at regular internvals. 

```json http
{
  "method": "post",
  "url": "https://api.terminal49.com/v2/webhooks",
  "headers": {
    "Authorization": "token YOUR_API_KEY"
  },
  "body": "{\n  aadsa\n}"
}
```

## Step 3: Create a Tracking Request

