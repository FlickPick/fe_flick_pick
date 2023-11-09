class UserFacade 

  def index(party_id)
    FlickPickService.new
                    .temp_users(party_id)
  end

  def create_user(params)
    user_data = {
      name: params[:name], 
      email: params[:email],
      role: params[:role],
      password: params[:password]
    }
    
    user_service = FlickPickService.new
    user_service.create_user(user_data)
  end

  def self.search_user(id)
    service = FlickPickService.new
    response = service.users_show(id)

    return nil unless response && response[:data] && response[:data][:attributes]

    attributes = response[:data][:attributes]
    User.new(
      id: response[:data][:id],
      name: attributes[:name],
      email: attributes[:email],
      role: attributes[:role]
    )
  end

  # def oauth_verification(email)
  #   response = FlickPickService.new.oauth_verification(email)
  #   response_body = JSON.parse(response.body, symbolize_names: true)
  #   if response.status == 201
  #     {
  #       status: response.status,
  #       user_id: response_body[:data][:id]
  #     }
  #   else
  #     {
  #       status: response.status, 
  #       error: response_body[:error]
  #     }
  #   end
  # end
end