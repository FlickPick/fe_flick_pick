class TempUserFacade
  def create_temp_user(params)
    temp_user_data = {
      access_code: params[:access_code],
      name: params[:name]
    }

    FlickPickService.new
                    .create_temp_user(temp_user_data)
  end

  def temp_users(party_id)
    data = FlickPickService.new
                           .temp_users(party_id)[:data]
    data.map do |temp_user|
      TempUser.new(temp_user)
    end
  end
end