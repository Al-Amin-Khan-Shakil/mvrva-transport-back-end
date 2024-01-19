# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

```
```
curl --header "Content-Type: application/json" ^     
 --request POST ^      
 --data "{\"user\": {\"email\":\"r@dev.com\", \"password\":\"12345678\"}}" ^      
 http://localhost:3000/sessions

curl --header "Content-Type: application/json" ^     
 --request POST ^      
 --data "{\"user\": {\"email\":\"r@dev.com\", \"password\":\"12345678\", \"password_confirmation\":\"12345678\"}}" ^      
 http://localhost:3000/registrations

 curl --header "Content-Type: application/json" ^     
 --request delete ^            
 http://localhost:3000/{user_id}/logout
```
