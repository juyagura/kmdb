class RolesController < ApplicationController
  def index
    @list_of_roles = Role.all
    @list_of_movies = Movie.all
    @list_of_actors = Actor.all
  end

  def show
    # Your code goes here
    # Use the information after the slash in the URL to look up the role with the corresponding ID number
    # Store the role in the @role instance variable so the view can format it
    list_of_roles = Role.all
    role_id = params[:id]
    @role = list_of_roles.find(role_id)
    @list_of_movies = Movie.all
    @list_of_actors = Actor.all
  end
end
