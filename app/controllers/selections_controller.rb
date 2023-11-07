class SelectionsController < ApplicationController
  def waiting_room
    @temp_users = TempUserFacade.new
                                .temp_users(params[:party_id])
    @movies = MovieFacade.new.movies(1, params[:party_id])
  end

  def index
    movies_arr = JSON.parse(params[:movies_arr])
    @movie = MovieFacade.new
                        .movie(movies_arr[0])
  end

  def round
    @liked_movies = LikedMovieFacade.new
                                    .liked_movies(params[:party_id])
  end

  def results
    @results = PartyFacade.new
                          .results(params[:party_id])
  end
end