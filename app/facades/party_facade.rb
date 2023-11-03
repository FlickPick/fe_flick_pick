class PartyFacade 
  def self.search_party(id)
    service = FlickPickService.new
    response = service.parties_show(id)
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
      access_code: params[:access_code], 
      max_duration: params[:max_duration],
      max_rating: params[:max_rating],
      genres: params[:genres],
      services: params[:services],
      movie_id: params[:movie_id]
    }
    
    party_service = FlickPickService.new
    party_service.create_party(party_data)
  end
end