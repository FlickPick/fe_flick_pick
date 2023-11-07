class LikedMovieFacade
  def liked_movies(party_id)
    FlickPickService.new
                    .liked_movies(party_id)
  end
end