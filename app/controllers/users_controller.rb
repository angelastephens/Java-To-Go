class UsersController < ApplicationController


  get '/users/new' do 

      erb :'/user/new'
  end 

  post '/signup' do
    @user = User.new(first_name: params[:first_name],last_name: params[:last_name],birthday: params[:birthday], phone_number: params[:phone_number], email_address: params[:email_address], user_name: params[:user_name], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/drinks/new"
    else 
      @error = "Ooops missing field, please try again!"
      erb :'/user/new'
    end
    
  end
end