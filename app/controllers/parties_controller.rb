class PartiesController < ApplicationController
  before_action :require_current_user

  def new
  end
  
  def show 
    @party = PartyFacade.search_party(params[:id])
  end

  def create
    @party_facade = PartyFacade.new
    response = @party_facade.create_party(params)
    if response.status == 201
      response_data = JSON.parse(response.body)
      party_id = response_data["data"]["id"]
      flash[:success] = "Party created successfully"
      redirect_to "/parties/#{party_id}"
    else
      flash[:error] = "Error creating party"
      render :new
    end
  end
end