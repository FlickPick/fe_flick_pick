class PartiesController < ApplicationController
  def show 
    @party = PartyFacade.search_party(params[:id])
  end
end