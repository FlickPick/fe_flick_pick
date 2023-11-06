class LikedMovieFacade
  def create_like(params)
    like_data = {
      round: params[:round],
      movie_id: params[:movie_id],
      temp_user_id: params[:id]
    }

    FlickPickService.new
                    .create_like(like_data)
  end
end