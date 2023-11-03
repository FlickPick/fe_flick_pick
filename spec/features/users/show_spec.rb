require "rails_helper"

RSpec.feature "User Dashboard", type: :feature do
  it "displays the users name and Dashboard on the top of the page", :vcr do
    visit "/users/new"

    fill_in "Name", with: "John"
    fill_in "Email", with: "400@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Create New User"
    expect(current_path).to eq("/users/2")
    expect(page).to have_content("John's Dashboard")
  end
end