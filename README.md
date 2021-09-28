# SweaterWeather

[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]




## Table of Contents

- [Overview](#overview)
- [Tools Utilized](#framework)
- [Contributors](#contributors)
- [Project Configurations](#setup)
- [Exposed Endpoints](#endpoints)


------

### <ins>Overview</ins>

[SweaterWeather](https://backend.turing.edu/module3/projects/sweater_weather/) is a 5 day, 1 person project, during Mod 3 of 4 for Turing School's Back End Engineering Program.

The challenge was to build a fully functional [JSON API 1.0 spec](https://jsonapi.org/)-compliant REST API that aggregates data from multiple third party API endpoints that require authentication, and renders responses back to authenticated users making requests from a separate front end web application framework.

Learning goals and areas of focus consisted of:

- Exposing an API that aggregates data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality
- Determining completion criteria based on the needs of other developers
- Researching, selecting, and consuming an API based on your individual needs as a developer

[Technical Requirements](https://backend.turing.edu/module3/projects/sweater_weather/requirements)

#### <ins>Framework</ins>
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
</p>

#### Languages
<p>
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-f74114.svg?&style=flaste&logo=JavaScript&logoColor=white" />
</p>

#### Tools
<p>
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-33b818.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  <img src="https://img.shields.io/badge/Postman-f74114.svg?&style=flat&logo=postman&logoColor=white" />
</p>

#### Gems
<p>
  <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  </br>
  <img src="https://img.shields.io/badge/factory--bot-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/faker-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/bcrypt-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/figaro-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
</p>

#### Development Principles
<p>
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>

### <ins>Contributors</ins>

👤  **Taylor Varoglu**
- Github: [Taylor Varoglu](https://github.com/tvaroglu)
- LinkedIn: [Taylor Varoglu](https://www.linkedin.com/in/taylorvaroglu/)

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/tvaroglu/sweater_weather.svg?style=flat
[contributors-url]: https://github.com/tvaroglu/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/tvaroglu/sweater_weather.svg?style=flat
[forks-url]: https://github.com/tvaroglu/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/tvaroglu/sweater_weather.svg?style=flat
[stars-url]: https://github.com/tvaroglu/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/tvaroglu/sweater_weather.svg?style=flat
[issues-url]: https://github.com/tvaroglu/sweater_weather/issues


## <ins>Setup</ins>

Find the project spec [here](https://backend.turing.edu/module3/projects/sweater_weather/)

This project requires Ruby 2.7.2 and Rails 5.2.6.

* Fork this repository
* Install gems and set up your database:
    * `bundle`
    * `rails db:{drop,create,migrate,seed}`
* Run the test suite with `bundle exec rspec -fd`
* Run your development server with `rails s`


### Project Configurations

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/tvaroglu/sweater_weather/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'sweater_weather_development'
    Created database 'sweater_weather_test'
    ```

* How to Run the Test Suite
    ```bash
    $ bundle exec rspec -fd
    ```

* Third Party API Access
  - This repository requires access to the following services:
    1. [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
    2. [MapQuest Geocoding & Route APIs](https://developer.mapquest.com/documentation/)
      1. [Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/address/get/)
      2. [Route API](https://developer.mapquest.com/documentation/directions-api/route/get/)
    3. [Unsplash JSON API](https://unsplash.com/documentation)


* [API Key Configuration](https://github.com/laserlemon/figaro)
    ```bash
    $ bundle exec figaro install
    ```
    - Add your API keys to `config/application.yml`:
      ```yml
      mq: <your MapQuest API key>
      ow: <your OpenWeather API key>
      us: 'Client-ID <your Unsplash API key>'
      ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop
    ```


## Endpoints


The `base path` of each endpoint is:

```
http://localhost:3000/api/v1
```

- For `GET` requests, you can send the endpoint requests through your internet browser, or utilize an API client (i.e. [Postman](https://www.postman.com/))
- For `POST` requests, you will need to use an API client to provide the required request body
- A fully functional [Postman collection](https://github.com/tvaroglu/sweater_weather/blob/main/spec/postman_collections/SweaterWeatherDemo.postman_collection.json) is included with this repository, to further assist with UAT and endpoint exploration


The following table presents each API endpoint and its associated documentation
- For `GET` requests, an example link is provided for demonstration purposes  

**Search Endpoints**                  | [Docs](/docs/search.md) | Examples
---------------------------|------------------------------------------|--------
Get Weather Forecast     | [docs](/docs/search.md#get-forecast)          | [example](http://localhost:3000/api/v1/forecast?location=denver,co)
Get City Background     | [docs](/docs/search.md#get-background)          | [example](http://localhost:3000/api/v1/backgrounds?location=denver,co)
Get Book Search     | [docs](/docs/search.md#get-books)          | [example](http://localhost:3000/api/v1/book-search?location=denver,co)

**User Endpoints**            | [Docs](/docs/users.md) | Examples
---------------------------|------------------------------------------|--------
New User Registration     | [docs](/docs/users.md#create-user)          |
User Authentication     | [docs](/docs/users.md#create-session)          |

**Road Trip Endpoint**            | [Docs](/docs/road_trip.md) | Examples
---------------------------|------------------------------------------|--------
Create New Road Trip     | [docs](/docs/road_trip.md#create-road-trip)          |
