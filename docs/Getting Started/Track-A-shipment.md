# Track A Shipment

So you want to start tracking your ocean shipments and containers and you have a few BL numbers. Follow the guide. 

Our API responses use [JSONAPI](https://jsonapi.org/) schema. There are [client libraries](https://jsonapi.org/implementations/#client-libraries) available in almost every language. Our API should work with these libs out of the box. 

Our APIs can be used with any HTTP client; choose your favorite! We love Postman, it's a friendly graphical interface to a powerful cross-platform HTTP client. Best of all it has support for the OpenAPI specs that we publish with all our APIs. We have created a collection of requests for you to easily test the API endpoints with your API Key. Link to the collection below. 

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/4989da1ade6756b2f636#?env%5Bproduction%5D=W3sia2V5IjoiYmFzZVVybCIsInZhbHVlIjoiaHR0cHM6Ly9hcGkudGVybWluYWw0OS5jb20vdjIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6IkFQSV9UT0tFTiIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX1d)

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

