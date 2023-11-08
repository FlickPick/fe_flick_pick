class PartyFacade 
  def self.search_party(id)
    service = FlickPickService.new
    response = service.parties_show(id)
    require 'pry';binding.pry
    attributes = response[:data][:attributes]
    Party.new(
      id: response[:data][:id],
      access_code: attributes[:access_code],
      max_rating: attributes[:max_rating],
      max_duration: attributes[:max_duration], 
      genres: attributes[:genres], 
      services: attributes[:services],
      movie_id: attributes[:movie_id]
      )
  end

  def create_party(params)
    party_data = {
      services: params[:services].join("|"),
      genres: params[:genres].join("|"),
      max_duration: params[:max_duration],
      max_rating: params[:max_rating],
      user_id: params[:user_id]
  }
    
    FlickPickService.new
                    .create_party(party_data)
  end

  def results(party_id)
    FlickPickService.new.results(party_id)
  end

  def update_party(party_id, movie_id)
    FlickPickService.new
                    .update_party(party_id, movie_id)
  end

  def details(party_id)
    Details.new(
      FlickPickService.new
                      .details_party(party_id)
    )
  end
end