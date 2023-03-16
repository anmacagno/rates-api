# Rates API

The objective of this project is the implementation of an endpoint that returns the rates available for a shipment using a FedEx web service.

For the implementation I used Ruby on Rails configured only as an API.

The API consists of the following endpoints:
- GET /rates

### Prerequisites

- Ruby 3.1.3
- Bundler 2.4.8

### Check out the repository

```bash
$ git clone https://github.com/anmacagno/rates-api.git
```

### Install the dependencies

```bash
$ bundle install
```

### Run the test suite

```bash
$ rails rspec
```

### Run the linter

```bash
$ rails rubocop
```

### Run the server

```bash
$ rails server
```

### Test an endpoint

If you are testing in the local environment the base url for the endpoints is http://localhost:3000/api/v1.

```bash
curl --location --request GET 'http://localhost:3000/api/v1/rates' \
--header 'Content-Type: application/json' \
--data '{
    "credentials": {
        "key": "your_key",
        "password": "your_password",
        "account_number": "your_account_number",
        "meter_number": "your_meter_number"
    },
    "quote_params": {
        "address_from": {
            "zip": "64000",
            "country": "mx"
        },
        "address_to": {
            "zip": "64000",
            "country": "mx"
        },
        "parcel": {
            "length": 25.0,
            "width": 28.0,
            "height": 46.0,
            "distance_unit": "cm",
            "weight": 6.5,
            "mass_unit": "kg"
        }
    }
}'
```

### Added gems

These are the gems that I added to the project:

- rspec-rails
- rubocop
- rubocop-performance
- rubocop-rails
- rubocop-rake
- rubocop-rspec
- [fedex-ws](https://github.com/anmacagno/fedex-ws)

### Project files

Where to start? Look at the file **app/controllers/api/v1/rates_controller.rb**.

Don't forget to look at the tests in the spec folder.
