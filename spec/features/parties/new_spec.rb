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

    expect(page).to have_content("Services")
    expect(page).to have_content("Netflix")
    expect(page).to have_content("Genres")
    expect(page).to have_content("Action")
    expect(page).to have_content("Max duration")
    expect(page).to have_button("Create New Party")
  end
end