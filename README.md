# Jungle

A mini e-commerce application built with Rails 4.2

## Preview

https://user-images.githubusercontent.com/35424606/158684779-c089aea2-3d98-4079-932a-1d26c0a895ef.mov


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.
Use any date after today as the expiry
Use any CCV


More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* PostgreSQL
* Sass rails
* Money rails

## Test Dependancies

* Byebug
* Quiet assets
* Dotenv rails
* Rspec rails
* Capybara
* Poltergeist
* Database cleaner
