require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome_signup
  end

  post "/" do
    redirect to "/drink_model/create_drinks"
  end

  # get '/signup' do 

  #     erb :signup
  # end 

  # post '/signup' do
      
  #     erb :signup
  # end


  get '/drink_model/create_drinks' do
    erb :'drink_model/create_drinks'
  end

  post "/drink_model/create_drinks" do
    
    redirect to "/homepage"
  end


end
