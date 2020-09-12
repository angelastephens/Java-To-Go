# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    * Created a easy to use and functioning web application in Rudby
- [x] Use ActiveRecord for storing information in a database
    * Created drink orders and stored them on the database 
- [x] Include more than one model class (e.g. User, Post, Category)
    * Users model and a drinks model 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) 
    * User has_many drinks
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    * Drink belongs_to user
- [x] Include user accounts with unique login attribute (username or email) *
    * User can signup with a username and password, user model validates that the user name is unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    * Users controller and drink controller containt RESTful CRUD routes
- [x] Ensure that users can't modify content created by other users
    * Methods in the drink controlled autorize_drink(user) and redirect_if not authorized
    * Both check to ensure the drink order is the created users drink.
- [x] Include user input validations 
    * Validations listed user model for first name, last name,birthday,phone number,user name, password.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    * Added 'sinatra-flash' to the gemfile
    * Added it to the configuration in APplicationController with 'register Sinatra::Flash'
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    * README complete

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message