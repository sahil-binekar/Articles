# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.3

* Rails version: 7.0.4

* Dependencies used

  ```gem 'devise'```
  
  ```gem 'devise-jwt```

* Procedure:

  Generate devise model by running
   ```rails g devise user``` with all the basic configurations.
   
  Generate the sessions and registrations controller with user scope
   ```rails g devise:controller user -c sessions registrations```.
 
* Using JTIMatcher for devise-jwt Revocation strategies

  Adding ```include Devise::JWT::RevocationStrategies::JTIMatcher```.
  
  ```devise :database_authenticatable, :jwt_authenticatable, jwt_revocation_strategy: self```, and
  
  ```
      def jwt_payload
        super
      end
  ```
   this code in user model

* Database creation
  Added new ```jti``` column in user table.
