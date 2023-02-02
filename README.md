# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

This project involves the development of various features and bug fixes for a web application using Ruby and the Rails framework

The functional requirements of the project include the implementation of features such as sold out badges, admin categories, user authentication, and order details page. Additionally, there are bug fixes for missing admin security and checking out with an empty cart. 

## Final Product

### Screenshot displaying a user who is signed in
!["Screenshot of user already sign in"](https://github.com/ManzarTelus/jungle-rail/blob/master/docs/User_signed_in.PNG)

### Screenshot of the Admin Dashboard page
!["Screenshot of the Admin Dashboard"]https://github.com/ManzarTelus/jungle-rail/blob/master/docs/admin_dashboard.PNG)

### Screenshot of the message displayed when the cart is empty
!["Screenshot of emty cart"](https://github.com/ManzarTelus/jungle-rail/blob/master/docs/empty_cart.PNG)

### Screenshot of the message displayed for a sold-out item
!["Screenshot displaying sold-out item"](https://github.com/ManzarTelus/jungle-rail/blob/master/docs/sold_out.PNG)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
