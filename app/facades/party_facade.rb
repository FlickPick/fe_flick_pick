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
      languages: attributes[:languages],
      format: attributes[:format],
      movie_id: attributes[:movie_id]
      )
  end
end