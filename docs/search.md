# Search Endpoints

HTTP Verb | Endpoint                   | Description                | Link
----------|----------------------------|----------------------------|---------------------------
GET      | `/forecast`                   | Get weather conditions for a given city.         | [Link](#get-forecast)
GET      | `/backgrounds`                   | Get an image for a given city.         | [Link](#get-background)
GET      | `/book-search`                   | Get books about a given city.         | [Link](#get-books)


---


## Get Forecast

Get weather information about a given city.

```
GET /forecast
```

### Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`location`  | String      | Query Parameters  | Required          | The city to search for.

### Example Request

```
GET http://localhost:3000/api/v1/forecast?location=denver,co
```

### Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2021-09-28T16:49:56.000-06:00",
        "sunrise": "2021-09-28T06:53:27.000-06:00",
        "sunset": "2021-09-28T18:47:23.000-06:00",
        "temperature": 74.57,
        "feels_like": 73.24,
        "humidity": 32,
        "uvi": 1.0,
        "visibility": 10000,
        "conditions": "scattered clouds",
        "icon": "03d"
      },
      "daily_weather": [
        {
          "date": "2021-09-28T12:00:00.000-06:00",
          "sunrise": "2021-09-28T06:53:27.000-06:00",
          "sunset": "2021-09-28T18:47:23.000-06:00",
          "max_temp": 79.25,
          "min_temp": 66.81,
          "conditions": "light rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-29T12:00:00.000-06:00",
          "sunrise": "2021-09-29T06:54:24.000-06:00",
          "sunset": "2021-09-29T18:45:45.000-06:00",
          "max_temp": 71.64,
          "min_temp": 51.89,
          "conditions": "heavy intensity rain",
          "icon": "10d"
        },
        {
          "date": "2021-09-30T12:00:00.000-06:00",
          "sunrise": "2021-09-30T06:55:21.000-06:00",
          "sunset": "2021-09-30T18:44:07.000-06:00",
          "max_temp": 60.91,
          "min_temp": 50.45,
          "conditions": "moderate rain",
          "icon": "10d"
        },
        {
          "date": "2021-10-01T12:00:00.000-06:00",
          "sunrise": "2021-10-01T06:56:19.000-06:00",
          "sunset": "2021-10-01T18:42:29.000-06:00",
          "max_temp": 69.57,
          "min_temp": 53.56,
          "conditions": "few clouds",
          "icon": "02d"
        },
        {
          "date": "2021-10-02T12:00:00.000-06:00",
          "sunrise": "2021-10-02T06:57:16.000-06:00",
          "sunset": "2021-10-02T18:40:52.000-06:00",
          "max_temp": 72.86,
          "min_temp": 57.49,
          "conditions": "clear sky",
          "icon": "01d"
        }
      ],
      "hourly_weather": [
        {
          "time": "2021-09-28T16:00:00.000-06:00",
          "temperature": 75.6,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T17:00:00.000-06:00",
          "temperature": 74.57,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T18:00:00.000-06:00",
          "temperature": 75.09,
          "conditions": "scattered clouds",
          "icon": "03d"
        },
        {
          "time": "2021-09-28T19:00:00.000-06:00",
          "temperature": 72.9,
          "conditions": "light rain",
          "icon": "10n"
        },
        {
          "time": "2021-09-28T20:00:00.000-06:00",
          "temperature": 71.19,
          "conditions": "light rain",
          "icon": "10n"
        },
        {
          "time": "2021-09-28T21:00:00.000-06:00",
          "temperature": 70.14,
          "conditions": "broken clouds",
          "icon": "04n"
        },
        {
          "time": "2021-09-28T22:00:00.000-06:00",
          "temperature": 67.82,
          "conditions": "overcast clouds",
          "icon": "04n"
        },
        {
          "time": "2021-09-28T23:00:00.000-06:00",
          "temperature": 66.81,
          "conditions": "overcast clouds",
          "icon": "04n"
        }
      ]
    }
  }
}
```

### Example Request - Empty Location Parameter

```
GET http://localhost:3000/api/v1/forecast?location=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Missing Location Parameter

```
GET http://localhost:3000/api/v1/forecast
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

---

## Get Background

Get an image background for a given city.

```
GET /backgrounds
```

### Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`location`  | String      | Query Parameters  | Required          | The city to search for.

### Example Request

```
GET http://localhost:3000/api/v1/backgrounds?location=denver,co
```

### Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": null,
    "type": "image",
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNjM2OTZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzI3ODMyODc&ixlib=rb-1.2.1"
      },
      "credit": {
        "provider": "Unsplash",
        "photographer": "Ryan De Hamer",
        "photographer_profile_url": "https://unsplash.com/@rdehamer"
      }
    }
  }
}
```

### Example Request - Empty Location Parameter

```
GET http://localhost:3000/api/v1/backgrounds?location=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Missing Location Parameter

```
GET http://localhost:3000/api/v1/backgrounds
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

---

## Get Books

Get books and weather forecast information about a given city.

```
GET /book-search
```

### Parameters

Name       | Data Type    | In    | Required/Optional | Description
-----------|--------------|-------|-------------------|------------
`location`  | String      | Query Parameters  | Required          | The city to search for.
`quantity`  | Integer      | Query Parameters  | Required          | The number of books to return.

### Example Request

```
GET http://localhost:3000/api/v1/book-search?location=denver,co&quantity=5
```

### Example Response

```
Status: 200 OK
```

```
{
  "data": {
    "id": null,
    "type": "books",
    "attributes": {
      "destination": "denver,co",
      "forecast": {
        "summary": "scattered clouds",
        "temperature": "74 F"
      },
      "total_books_found": 605,
      "books": [
        {
          "isbn": [
            "9780762507849",
            "0762507845"
          ],
          "publisher": [
            "Universal Map Enterprises"
          ],
          "title": "Denver, Co"
        },
        {
          "isbn": [
            "9780607620054",
            "0607620056"
          ],
          "publisher": [
            "USGS Branch of Distribution"
          ],
          "title": "Denver west, CO and Bailey, CO: Denver, CO"
        },
        {
          "isbn": [
            "0607620048",
            "9780607620047"
          ],
          "publisher": [
            "USGS Branch of Distribution"
          ],
          "title": "Denver East, CO and Castle Rock, CO: Denver, CO"
        },
        {
          "isbn": [
            "1427401683",
            "9781427401687"
          ],
          "publisher": [
            "College Prowler"
          ],
          "title": "University of Denver Co 2007"
        },
        {
          "isbn": [
            "9780762557363",
            "0762557362"
          ],
          "publisher": [
            "Universal Map Enterprises"
          ],
          "title": "Denver Co Deluxe Flip Map"
        }
      ]
    }
  }
}
```

### Example Request - Empty Location Parameter

```
GET http://localhost:3000/api/v1/book-search?location=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Missing Location Parameter

```
GET http://localhost:3000/api/v1/book-search
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid city and state"
  ]
}
```

### Example Request - Bad Quantity Parameter (Non-Integer)

```
GET http://localhost:3000/api/v1/book-search?location=denver,co&quantity=dgsdgdsg
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid quantity"
  ]
}
```

### Example Request - Bad Quantity Parameter (Integer)

```
GET http://localhost:3000/api/v1/book-search?location=denver,co&quantity=0
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid quantity"
  ]
}
```

### Example Request - Empty Quantity Parameter

```
GET http://localhost:3000/api/v1/book-search?location=denver,co&quantity=
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid quantity"
  ]
}
```

### Example Request - Missing Quantity Parameter

```
GET http://localhost:3000/api/v1/book-search?location=denver,co
```

### Example Response

```
Status: 400 Bad Request
```

```
{
  "message": "your query could not be completed",
  "errors": [
    "please provide a valid quantity"
  ]
}
```
