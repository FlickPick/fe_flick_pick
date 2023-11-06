require "rails_helper"

RSpec.feature "User Dashboard", type: :feature do
  it "displays the users name and Dashboard on the top of the page", :vcr do
    visit "/sessions/new"

    fill_in "Email", with: "500@example.com"
    fill_in "Password", with: "password123"
  
    click_button "Log in"

    expect(page).to have_content("John's Dashboard")
    expect(page).to have_button("Create Party")
    expect(page).to have_content("Your Top Picks:")
  end
end