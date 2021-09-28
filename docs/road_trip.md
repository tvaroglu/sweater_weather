# Road Trip Endpoint

HTTP Verb | Endpoint                   | Description                | Link
----------|----------------------------|----------------------------|---------------------------
POST      | `/road_trip`                   | Create a new road trip.         | [Link](#create-road-trip)

---

## Create Road Trip

Create a new road trip with the provided attributes.

```
POST /road_trip
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`origin`                  | String    | Required          | The starting city for the road trip.
`destination`              | String    | Required          | The ending city for the road trip.
`api_key`       | String    | Required          | The user's API key.


### Example Request - Valid Route

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "012ffeafdc8dd8b182718f9240"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "Pueblo,CO",
      "travel_time": "1h44m",
      "weather_at_eta": {
        "temperature": 75.06,
        "conditions": "broken clouds"
      }
    }
  }
}
```

### Example Request - Invalid Route

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Denver,CO",
  "destination": "London,UK",
  "api_key": "012ffeafdc8dd8b182718f9240"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "London,UK",
      "travel_time": "Impossible Route",
      "weather_at_eta": {
        "temperature": null,
        "conditions": null
      }
    }
  }
}
```

### Example Request - Bad or Missing API Key

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO"
}
```

### Example Response

```
Status: 401 Unauthorized
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "invalid API key"
  ]
}
```

### Example Request - Missing Origin or Destination

```
POST http://localhost:3000/ap1/v1/road_trip
```

With the following request body:

```
{
  "origin": "Denver,CO",
  "api_key": "012ffeafdc8dd8b182718f9240"
}
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "origin and destination are required to plan a route"
  ]
}
```
