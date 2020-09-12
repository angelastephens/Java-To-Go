class DrinksController < ApplicationController

  # GET: /drinks- done 
  get "/drinks" do
    @bg = "https://media1.thehungryjpeg.com/thumbs2/ori_3816392_xb548tcv59f8f0sj0rv1ezc3j70zg6794umksinl_coffee-cup-seamless-pattern-sketch-tea-and-coffee-cups-hot-drinks-va.jpg"
    erb :"/drinks/index.html"
  end


  # GET: /drinks/new- done 
  get "/drinks/new" do
    @bg = "https://i.pinimg.com/originals/2f/74/7c/2f747c82bed528308400333fbf80d12a.jpg"
    erb :"/drinks/new.html"
  end

  # POST: /drinks
  post "/drinks" do
    current_user.drinks << Drink.create(params) 
    redirect "/drinks"
  end



  # GET: /drinks/5
  get "/drinks/:id" do
    @bg = "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/hand-drawn-background-of-electric-coffee-grinder-with-coffee-beans-iam-nee.jpg"
    @drinks = Drink.find(params[:id])  
    erb :"/drinks/show.html"
  end

  # GET: /drinks/5/edit
    
  get "/drinks/:id/edit" do
    @bg = "https://media.istockphoto.com/vectors/coffee-makers-set-percolator-syphon-pourover-cezve-french-press-cups-vector-id1180882723"
    @drinks = Drink.find(params[:id])
    erb :"/drinks/edit.html"
  end

  # PATCH: /drinks/5
  patch "/drinks/:id" do
    @drinks = Drink.find(params[:id])
    @drinks.update(drink_name: params[:drink_name],temperature: params[:temperature], caffeine_type: params[:caffeine_type], milk_options: params[:milk_options], flavors: params[:flavors])
    redirect "/drinks"
  end

  # DELETE: /drinks/5/delete
  delete "/drinks/:id" do
    @drinks = Drink.find(params[:id])
    @drinks.destroy
    redirect "/drinks"
  end
end
