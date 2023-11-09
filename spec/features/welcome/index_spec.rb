require 'rails_helper'

RSpec.feature "Welcome Page", type: :feature do
  it "displays 'Log in with Google' button" do
    visit root_path  

    expect(page).to have_button("Log in with Google")
  end
end