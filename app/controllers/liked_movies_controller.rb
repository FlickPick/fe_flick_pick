class LikedMoviesController < ApplicationController
  # def create
  #     #put likedmovie create here (params[:round], params[:movie_arr][0], session[user_id])
  #   unless params[:movie_arr].count = 1
  #     params[:movie_arr].shift
  #     redirect_to "/picks?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
  #   else
  #     new_round = params[:round] + 1
  #     redirect_to "/liked_movies?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
  #   end
  # end
  
  # def next 

  #   unless params[:movie_arr].count <= 1
  #     params[:movie_arr].shift
  #     redirect_to "/picks?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
  #   else
  #     new_round = params[:round] + 1
  #     redirect_to "/liked_movies?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
  #   end
  # end

  # def index
  #   #@liked movies
  # end
end