class PicksController < ApplicationController
  def waiting_room
    @temp_users = TempUserFacade.new
                                .temp_users(params[:party_id])
    @movies = MovieFacade.new.movies(1, params[:party_id])
  end

  # def show
  #   # @movie = MoviesFacade.new.movie_show(params[:movie_arr][0])
  # end
end