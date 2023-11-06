class MovieFacade
  def movies(round, party_id)
    FlickPickService.new
                    .movies(round, party_id)
  end
end