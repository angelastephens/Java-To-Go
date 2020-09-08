class DrinksController < ApplicationController

  # GET: /drinks- done 
  get "/drinks" do
    erb :"/drinks/index.html"
  end


  # GET: /drinks/new- done 
  get "/drinks/new" do
    erb :"/drinks/new.html"
  end

  # POST: /drinks
  post "/drinks" do
    current_user.drinks << Drink.create(params) 
    redirect "/drinks"
  end



  # GET: /drinks/5
  get "/drinks/:id" do
    @drinks = Drink.find(params[:id])
    erb :"/drinks/show.html"
  end

  # GET: /drinks/5/edit
  get "/drinks/:id/edit" do
    erb :"/drinks/edit.html"
  end

  # PATCH: /drinks/5
  patch "/drinks/:id" do
    redirect "/drinks/:id"
  end

  # DELETE: /drinks/5/delete
  delete "/drinks/:id/delete" do
    redirect "/drinks"
  end
end
