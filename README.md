# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* run seed to create default user. database is sqlite for ease since its just test

* to login 

```
POST http://localhost:3000/api/login

{
"user": {
        "email": "user@example.com",
        "password": "123456"
    }
}
```

* to make a transaction
```
POST localhost:3000/api/transactions

{"transaction": {"customer_id": "PC035079", "input_amount": 59.50, "input_currency": "$", "output_amount": 2500.59, "output_currency": "GMD" }}

```


* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
