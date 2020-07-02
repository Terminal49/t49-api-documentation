# Quick Start: Track your first container

So you want to start tracking your ocean shipments and containers and you have a few BL numbers. Follow the guide. 

Our API responses use [JSONAPI](https://jsonapi.org/) schema. There are [client libraries](https://jsonapi.org/implementations/#client-libraries) available in almost every language. Our API should work with these libs out of the box. 

Our APIs can be used with any HTTP client; choose your favorite! We love Postman, it's a friendly graphical interface to a powerful cross-platform HTTP client. Best of all it has support for the OpenAPI specs that we publish with all our APIs. We have created a collection of requests for you to easily test the API endpoints with your API Key. Link to the collection below. 

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/4989da1ade6756b2f636#?env%5Bproduction%5D=W3sia2V5IjoiYmFzZVVybCIsInZhbHVlIjoiaHR0cHM6Ly9hcGkudGVybWluYWw0OS5jb20vdjIiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6IkFQSV9UT0tFTiIsInZhbHVlIjoiIiwiZW5hYmxlZCI6dHJ1ZX1d)

---

## 1. Get API Key

Sign in to your Terminal49 account and go to your [developer portal](https://app.terminal49.com/developers/api_keys) page to get your API key. 

> If you don't have an API key and you would you like to access the API during the beta period please reach out to us at [support@terminal49.com](mailto:support@terminal49.com)
---
## Step 2: Register a webhook

The Terminal49 API is an event driven API. Once you start tracking a shipment, any updates to the shipment or it's containers such as ETA changes or milestones can trigger notification events. Events that get triggered can be subscribed to via [Webhook](https://sendgrid.com/blog/whats-webhook/). 

This is not a requirement to track a shipment. You can skip and do this later if you'd like. 

```json http
{
  "method": "post",
  "url": "https://api.terminal49.com/v2/webhooks",
  "headers": {
    "Content-Type": "application/vnd.api+json",
    "Authorization": "token YOUR_API_KEY"
  },
  "body": "{\r\n  \"data\": {\r\n    \"type\": \"webhook\",\r\n    \"attributes\": {\r\n      \"url\": \"https:\/\/webhook.site\/\",\r\n      \"active\": true,\r\n      \"events\": [\r\n        \"*\"\r\n      ]\r\n    }\r\n  }\r\n}"
}
```

## Step 3: Create a Tracking Request

In order to start tracking your shipments you have make a request using the /tracking_request API. Tracking is asynchornous, this means once you make a request to track a shipment, Terminal49 will attempt to trace it at the ocean carrier. 

Once found Termianl49 will create a shipment record, update the tracking_request `status` and trigger a `tracking_request.succeeded` notifcation if setup a webhook in step 2. 

Initially the response for the successful tracking_request will respond with `status` attribute as `pending`.  

**Try it using the request maker below!**
1. Enter your API token in the autorization header value. 
2. Enter a value for the `request_number` and `scac`. The request number has to be a shipping line booking or master bill of lading number. The SCAC has to be a shipping line scac (see data sources to get a list of valid SCACs)

```json http
{
  "method": "post",
  "url": "https://api.terminal49.com/v2/tracking_requests",
  "headers": {
    "Content-Type": "application/vnd.api+json",
    "Authorization": "token YOUR_API_KEY"
  },
  "body": "{\r\n  \"data\": {\r\n    \"attributes\": {\r\n      \"request_type\": \"bill_of_lading\",\r\n      \"request_number\": \"\",\r\n      \"scac\": \"\"\r\n    },\r\n    \"type\": \"tracking_request\"\r\n  }\r\n}"
}
```
