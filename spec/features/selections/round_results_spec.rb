require 'rails_helper'

feature "User can see results" do
  describe "As a temp user " do
    describe "When I visit the results page" do
      it "I see the results" do
        WebMock.allow_net_connect! 
        WebMock.disable! 
        VCR.eject_cassette 
        VCR.turn_off!(:ignore_cassettes => true)

        visit results_path

        expect(page).to have_content("Results")
      end
    end
  end
end