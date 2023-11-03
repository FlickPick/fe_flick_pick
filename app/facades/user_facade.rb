class UserFacade 

  def create_user(params)
    user_data = {
      name: params[:name], 
      email: params[:email],
      role: params[:role],
      password_digest: params[:password]
    }
    
    user_service = FlickPickService.new
    user_service.create_user(user_data)
  end

  def self.search_user(id)
    service = FlickPickService.new
    response = service.users_show(id)
    attributes = response[:data][:attributes]
    User.new(
      id: response[:data][:id],
      name: attributes[:name],
      email: attributes[:email],
      role: attributes[:role],
      movie_history: attributes[:movie_history]
      )
  end
end