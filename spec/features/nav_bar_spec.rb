require "rails_helper"

RSpec.describe 'Navbar', type: :feature do
  it 'displays the navbar and links' do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    visit "/" 
    
    expect(page).to have_css("nav.navbar")
    
    within("nav.navbar") do
      expect(page).to have_link("Flick Pick")
    end

    expect(page).to have_button("Log in with Google")
    expect(page).to have_link("Sign in")
    expect(page).to have_link("Create User")
  end
end