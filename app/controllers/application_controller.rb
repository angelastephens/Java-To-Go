require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true
    register Sinatra::Flash
  end

  get "/" do
    @bg = "https://st3.depositphotos.com/3746151/13017/v/950/depositphotos_130173158-stock-illustration-sketch-of-coffee-shop-in.jpg"
    erb :'/welcome_signup'
  end

  private 

  def current_user 
    User.find_by_id(session[:id])
  end

  def logged_in?
    !!current_user
  end


  
  # get '/users/new' do 

  #     erb :'/user/new'
  # end 

  # post '/signup' do
  #   @user = User.new(first_name: params[:first_name],last_name: params[:last_name],birthday: params[:birthday], phone_number: params[:phone_number], email_address: params[:email_address], user_name: params[:user_name], password: params[:password])
  #   if @user.save
  #     session[:id] = @user.id
  #     redirect "/drinks/new"
  #   else 
  #     @error = "Ooops missing field, please try again!"
  #     erb :'/user/new'
  #   end
    
  # end


  # get '/drink_model/create_drinks' do
  #   erb :'/drink_model/create_drinks'
  # end

  # post "/drink_model/create_drinks" do
    
  #   redirect to "/homepage"
  # end




end
