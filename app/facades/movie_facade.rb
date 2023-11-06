class MovieFacade
  def movies(round, party_id)
    FlickPickService.new
                    .movies(round, party_id)
  end

  def movie(id)
    Movie.new(
      FlickPickService.new
                      .movie(id)[:data])
  end
end