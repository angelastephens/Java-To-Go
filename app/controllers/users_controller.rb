class UsersController < ApplicationController


  get '/users/new' do  #renders the new user form to sign up / sends the date to post 

      erb :'/user/new'
  end 

  post '/signup' do #checks to make sure the use entered all the required params before creating a new user, if yes then redirects to their new drink page.
    @user = User.new(first_name: params[:first_name],last_name: params[:last_name],birthday: params[:birthday], phone_number: params[:phone_number], email_address: params[:email_address], user_name: params[:user_name], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/drinks/new"
    else # if a param is missing it will redirect the use to sign up again 
      @error = "Ooops missing field or user name is taken. Please try again!"
      erb :'/user/new'
    end
    
  end

  get '/home' do #renders my homepage 

    erb :'/user/homepage'
  end
end