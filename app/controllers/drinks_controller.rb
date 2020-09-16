class DrinksController < ApplicationController

  # GET: /drinks- done 
  get "/drinks" do # renders the users index which displays their list of drinks and has a specific backgroun image 
    @bg = "https://media1.thehungryjpeg.com/thumbs2/ori_3816392_xb548tcv59f8f0sj0rv1ezc3j70zg6794umksinl_coffee-cup-seamless-pattern-sketch-tea-and-coffee-cups-hot-drinks-va.jpg"
    erb :"/drinks/index.html"
  end


  # GET: /drinks/new- done 
  get "/drinks/new" do #renders the new drink form and a background image 
    @drinks = Drink.new 
    @bg = "https://i.pinimg.com/originals/2f/74/7c/2f747c82bed528308400333fbf80d12a.jpg"
    erb :"/drinks/new.html"
  end

  # POST: /drinks
  post "/drinks" do # post method that collects the forms data in params and creates a new drink and adds it to the users list of drinks then redirects to the drinks page which displays users dirnks
    @bg = "https://i.pinimg.com/originals/2f/74/7c/2f747c82bed528308400333fbf80d12a.jpg"
    @drinks = current_user.drinks.build(params) 
    if @drinks.save
      redirect "/drinks"
    else # if a param is missing it will render the new drink form again with an error message  
      @error = "Ooops don't forget to name your delicious drink!  Please try again!"
      erb :'/drinks/new.html'
    end
  end



  # GET: /drinks/5
  get "/drinks/:id" do #initiates a drinks variable which then finds a drink based on the params :id  and renders the drinks show page which shows the details of the drink
    @bg = "https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/hand-drawn-background-of-electric-coffee-grinder-with-coffee-beans-iam-nee.jpg"
    redirect_if_not_authorized
    @drinks = Drink.find(params[:id])  
    erb :"/drinks/show.html"
  end

  # GET: /drinks/5/edit
    
  get "/drinks/:id/edit" do #http verb that renders the edit form of a users drink that was pulled by the params id
    redirect_if_not_authorized
    @bg = "https://media.istockphoto.com/vectors/coffee-makers-set-percolator-syphon-pourover-cezve-french-press-cups-vector-id1180882723"
    @drinks = Drink.find(params[:id])
    erb :"/drinks/edit.html"
  end

  # PATCH: /drinks/5
  patch "/drinks/:id" do #http verb that updates the drink with the data that was sent from the edit form then redirects to users list of drinks 
    redirect_if_not_authorized
    @drinks.update(drink_name: params[:drink_name],temperature: params[:temperature], caffeine_type: params[:caffeine_type], milk_options: params[:milk_options], flavors: params[:flavors])
    redirect "/drinks"
  end

  # DELETE: /drinks/5/delete
  delete "/drinks/:id" do # deletes a users drink when called then redirects to the drink page to display users drinks 
    redirect_if_not_authorized
    @drinks.destroy
    redirect "/drinks"
  end

  def redirect_if_not_authorized # helper method that will redirect the use if they try to access a page or drink that does not belong to them
    @drinks= Drink.find(params[:id])
    redirect_if_not_logged_in
    if !authorize_drink(@drinks)
      flash[:error] = "You do not have the right permissions to do that!"
      redirect "/drinks"
    end 
  end

  def authorize_drink(drink) #checks to see if the user owns the drink  
    current_user == drink.user
  end


  def redirect_if_not_logged_in #helper method that checks to see if the user is log in and displays and error message if not
    if !logged_in?
      flash[:error] = "You must be logged in to view this page"
      redirect request.referrer || "/login" #request.referrer helper method that redirects to root web app or login page 
    end
  end

end
