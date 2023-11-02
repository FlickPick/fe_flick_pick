class UserFacade 
  def self.search_user(id)
    service = FlickPickService.new
    response = service.users_show(id)
    attributes = response[:data][:attributes]
    User.new(
      id: response[:data][:id],
      name: attributes[:name],
      email: attributes[:email],
      role: attributes[:role], 
      language_pref: attributes[:language_pref], 
      movie_history: attributes[:movie_history]
      )
  end
end