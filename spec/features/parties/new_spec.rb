require "rails_helper"

feature "User can start a party" do
  it "will display a form" do

      WebMock.allow_net_connect! 
      WebMock.disable! 
      VCR.eject_cassette 
      VCR.turn_off!(:ignore_cassettes => true)

    visit new_session_path

    fill_in "Email", with: "joop@turing.edu"
    fill_in "Password", with: "Joop!12345"

    click_button "Log in"
    
    visit new_party_path

    # save_and_open_page
  end
end