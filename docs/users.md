# Users Endpoints

HTTP Verb | Endpoint                   | Description                | Link
----------|----------------------------|----------------------------|---------------------------
POST      | `/users`                   | Create a new user.         | [Link](#create-user)
POST      | `/sessions`                   | Authenticate an existing user.         | [Link](#create-session)


---

## Create User

Create a new user with the provided attributes.

```
POST /users
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`email`                  | String    | Required          | The user's email.
`password`              | String    | Required          | The user's password.
`password_confirmation`       | String    | Required          | The user's password confirmation.


### Example Request

```
POST http://localhost:3000/ap1/v1/users
```

With the following request body:

```
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": "4",
    "type": "user",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "8a7d8bde1eeb59722ec3f9b6da"
    }
  }
}
```

### User Already Exists

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "Email has already been taken"
  ]
}
```

### Password Confirmation Mismatch

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "Password confirmation doesn't match Password"
  ]
}
```

### Password Confirmation Missing

```
Status: 422 Unprocessable Entity
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "'password_confirmation' is required to create a user account"
  ]
}
```

---

## Create Session

Authenticate an existing user.

```
POST /sessions
```

### Request Body

Name                     | Data Type | Required/Optional | Description
-------------------------|-----------|-------------------|------------
`email`                  | String    | Required          | The user's email.
`password`              | String    | Required          | The user's password.


### Example Request

```
POST http://localhost:3000/ap1/v1/sessions
```

With the following request body:

```
{
  "email": "whatever@example.com",
  "password": "password"
}
```

### Example Response

```
Status: 201 Created
```

```
{
  "data": {
    "id": "4",
    "type": "user",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "8a7d8bde1eeb59722ec3f9b6da"
    }
  }
}
```

### Invalid Password, Missing Password, or User Email Not Found

```
Status: 401 Unauthorized
```

```
{
  "message": "your record could not be saved",
  "errors": [
    "invalid credentials provided, please try again"
  ]
}
```
