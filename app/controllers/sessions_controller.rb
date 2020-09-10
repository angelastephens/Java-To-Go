class SessionsController < ApplicationController
    
    get '/login' do 
      @bg = "https://image.shutterstock.com/image-vector/bag-coffee-beans-vintage-style-600w-1468619435.jpg"
      erb :'/user/login'
    end
  
    post '/login' do 
      # find the user by their user name:
      user = User.find_by(user_name: params[:user_name])
      # if they typed in the right password then log them in, if not show them the form again
      if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect "/home"
      else 
        @error = "Incorrect user name or password"
        erb :'/user/login'
      end
    end

    delete '/logout' do 
      session.clear
      redirect "/"
    end
end