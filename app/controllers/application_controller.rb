require './config/environment' #loads the environment file 

class ApplicationController < Sinatra::Base #sintatra base gives access to methods 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true #enabling sessions for uses to visit different pages without having to keep logging in each time ( enables cookies)
    set :session_secret, ENV["SESSION_SECRET"] # sign cookies with a secure key to make it harder to steal
    set :method_override, true #lets you overide the post method in the form to let you use patch and delete
    register Sinatra::Flash # allows you to display message to the user such as an error message 
    set :show_exceptions, :after_handler
  end

  get "/" do #http verb that is setting the index route to render welcome page 
    @bg = "https://st3.depositphotos.com/3746151/13017/v/950/depositphotos_130173158-stock-illustration-sketch-of-coffee-shop-in.jpg"
    erb :'/welcome_signup'
  end
  error ActiveRecord::RecordNotFound do 
    flash[:error] = "couldn't find that page"
    redirect '/drinks'
  end 

  private 

  def current_user  #helper method to determine if the user has an active session 
    User.find_by_id(session[:id])
  end

  def logged_in? #confirming wheter or not the users is logged in ..checks by session id. if no id it will return false and if yes return true
    !!current_user #double bang which returns a boolean 
  end




end
