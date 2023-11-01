class UserFacade 
  def self.search_user(id)
    service = FlickPickService.new
    response = service.users_show(id)

    attributes = json[:data][:attributes]
    User.new(
      id: json[:data][:id],
      name: attributes[:name],
      email: attributes[:email],
      role: attributes[:role], 
      language_pref: attributes[:language_pref], 
      movie_history: attributes[:movie_history]
      )
  end
end