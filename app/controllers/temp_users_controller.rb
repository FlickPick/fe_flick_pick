class TempUsersController < ApplicationController
  def create
    @temp_user_facade = TempUserFacade.new
    response = @temp_user_facade.create_temp_user(params)
    if response.status == 201
      response_data = JSON.parse(response.body)
      temp_user_id = response_data["id"]
      party_id = response_data["party_id"]
      flash[:success] = "Party created successfully"
      redirect_to "/temp_users/#{temp_user_id}/picks/waiting_room?party_id=#{party_id}&access_code=#{params[:access_code]}"
    else
      flash[:error] = "Invalid code"
    end
  end

end