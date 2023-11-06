class TempUserFacade
  def create_temp_user(params)
    temp_user_data = {
      access_code: params[:access_code],
      name: params[:name]
    }

    FlickPickService.new
                    .create_temp_user(temp_user_data)
  end
end