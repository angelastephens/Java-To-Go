class SessionsController < ApplicationController
    #sessions controller handles the begining and end of a session 
    get '/login' do #renders users log in form 
      @bg = "https://image.shutterstock.com/image-vector/bag-coffee-beans-vintage-style-600w-1468619435.jpg"
      erb :'/user/login'
    end
  
    post '/login' do # collect the users log in information and makes sure the username and password is valid then starts a new session with the id 
      @bg = "https://image.shutterstock.com/image-vector/bag-coffee-beans-vintage-style-600w-1468619435.jpg"

      # find the user by their user name:
      user = User.find_by(user_name: params[:user_name])
      # if they typed in the right password then log them in, if not show them the form again
      if user && user.authenticate(params[:password]) #authenticate hashes what the users types in then compares it to the hash version of the original password 
        session[:id] = user.id
        redirect "/home"
      else 
        @error = "Incorrect user name or password"
        erb :'/user/login'
      end
    end

    delete '/logout' do #logs out and clears the session hash 
      session.clear
      redirect "/"
    end
end