# Disburse service application

## Installation
You need to have Ruby 2.5.1 installed.
Follow these easy steps to install and start the app:
~~~
bundle install
~~~
You can modify `database.yml` credentials and next, execute the database migrations/schema setup:
~~~
rake db:create
rake db:migrate
~~~
Start the Rails app locally:
~~~
rails s
~~~

## Application

This application calculates the disbursement fees weekly on monday for all the merchants in DB.


### Architecture and models

#### Models
- **Merchant**: Merchant that has an account with us.
- **Shopper**: Customer that buys something from the merchant.
- **Order**: Shopping cart from a shopper in a merchant's shop.
- **Disbursement**: Weekly calculated disbursement fees for merchants.

#### API
(Comming soon in Swagger Docs)

There is only an endpoint available in the app to retrieve the disbursements for a given merchant.
~~~
GET /api/v1/merchants/:merchant_id/disbursements(.:week)
~~~
The optional date param `week` can be used to filter the response objects.

### Development

There is a rake task that is scheduled to run every monday at 7am. Cron jobs in the server must be enabled.
