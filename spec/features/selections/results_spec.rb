require 'rails_helper'

feature "User can see results" do
  describe "As a temp user " do
    describe "When I visit the results page" do #012345
      it "users can see the results" do
        WebMock.allow_net_connect! 
        WebMock.disable! 
        VCR.eject_cassette 
        VCR.turn_off!(:ignore_cassettes => true)

        visit results_path("012345")

        expect(page).to have_content("Results")
      end

      it "users go to a waiting room to wait for friends" do
        WebMock.allow_net_connect! 
        WebMock.disable! 
        VCR.eject_cassette 
        VCR.turn_off!(:ignore_cassettes => true)

        visit "/"

        fill_in "Your name:", with: "Testmen"
        fill_in "Access Code:", with: "012345"

        click_button "Join Party"

        expect(page).to have_content("Please Wait Until Your Whole Party Is Here!")
        expect(page).to have_content("Joined Users")

        click_button "Everyone is here"
        
        expect(page).to have_button("Like")
        expect(page).to have_button("Not Today")
      end
    end
  end
end