class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

    # Your Ruby goes here.
    ascending_movie_list = Movie.order(year: :asc)
    @year_of_oldest_movie = ascending_movie_list.first.year
  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    # Your Ruby goes here.
    first_movie_of_the_list = Movie.first
    id_of_director_of_first_movie = first_movie_of_the_list.director_id
    list_of_movies_directed_by_first_movie_director = Movie.where({ :director_id => id_of_director_of_first_movie })
    @number_of_movies_directed_by_first_movie_director = list_of_movies_directed_by_first_movie_director.count
  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.
    @max = 0
    Director.all.each do |d_id|
      n = Movie.all.where(director_id: d_id).count
      if n > @max
        @max = n
      end
    end
    @most_number_of_movies_by_a_single_director = @max
  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.
    id_of_first_actor = Actor.first.id
    list_of_movies_the_actor_appeared_in = Role.where({ :actor_id => id_of_first_actor })
    @max = 0
    list_of_movies_the_actor_appeared_in.each do |movie|
      mid = movie.movie_id
      year = Movie.all.find(mid).year.to_i
      if year > @max
        @max = year
        @title = Movie.all.find(mid).title
      end
    end
    # .order(year: :desc)
    @most_recent_movie_for_first_actor = @title
  end
end
