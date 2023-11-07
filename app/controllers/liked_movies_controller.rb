class LikedMoviesController < ApplicationController
  def create
      #put likedmovie create here (params[:round], params[:movie_arr][0], session[user_id])
    response = LikedMovieFacade.new 
                               .create_like(params) 
    movies_arr = JSON.parse(params[:movies_arr])
    unless movies_arr.count == 1
      movies_arr.shift
      redirect_to "/temp_users/#{params[:id]}/selections?round=#{params[:round]}&movies_arr=#{movies_arr}"
    else
      new_round = params[:round] + 1
      redirect_to "/liked_movies?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
    end
  end
  
  def next 
    movies_arr = JSON.parse(params[:movies_arr])
    unless movies_arr.count <= 1
      movies_arr.shift
      redirect_to "/temp_users/#{params[:id]}/selections?round=#{params[:round]}&movies_arr=#{movies_arr}"
    else
      new_round = params[:round] + 1
      redirect_to "/liked_movies?round=#{params[:round]}&movie_arr=#{params[:movie_arr]}"
    end
  end

  # def index
  #   #@liked movies
  # end
end
