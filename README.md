# Java-To-Go
Java To Go is an app for creating your favorite coffee drink so it will be easier to order on the go. With Java To Go a user will be able to create, store, review edit, and delete their current coffee creations. The coffee creations will be stored within their profile and will be accessible with each log in. 
## Installation
To try out Java-To-Go:
- download or clone the repository so it will be on your computer 
- Next ```cd``` into the Java-To-Go directory
- Run ```bundle install``` in your terminal. 
- Create a file in the root directory called ```.env```
- Inside ```.env```, enter ```SESSION_SECRET=``` this is a key used for encrypting cookies.
- In your terminal, run ```generate_secret``` to get your own unique key.
- Copy and paste the output into your ```.env``` file directly after ```SESSION_SECRET=``` example SESSION_SECRET= random key goes here
- Create a file in the root directory called ```.gitignore```
- Inside ```.gitignore```, enter ```.env```. This will make sure your ```.env``` file is not tracked in github and only you the user will   have access to the ```SESSION_SECRET=```. 
- Run ```rake db:migrate``` to migrate the 
- Type```shotgun``` in your terminal. This will connect to the server so you can have access to the application
- Open up your web browser and enter the local url provided by the shotgun server. From there you can begin using the application
- To end the program make sure you type in the terminal control C. If you do not end shotgun then a new session will not be able to run the next time you open it. 

## Using Java-To-Go
- If you are new to the application you will start my clicking "Sign up". This allows someone to create an account that is specific to them.
- If you already have an account, simply click "Log in". 
- After an initial sign up the user will be directed to create a drink and save it. 
- If the user is clicking log in, then they will be directed to their homepage where they can either create a new drink or view their current drinks. 
- The user will also be able to edit and delete any drink creations they have made.

Happy drink creating!! 
