class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
  end

  def show
    # Your code goes here
    # Use the information after the slash in the URL to look up the director with the corresponding ID number
    # Store the director in the @director instance variable so the view can format it
    list_of_directors = Director.all
    director_id = params[:id]
    @director = list_of_directors.find(director_id)
  end
end
