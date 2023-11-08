require "rails_helper"

RSpec.feature "User Dashboard", type: :feature do
  it "displays the users name and Dashboard on the top of the page", :vcr do
    visit "/sessions/new"

    fill_in "Email", with: "ethan@turing.edu"
    fill_in "Password", with: "Ethan!12345"
    click_button "Log in"
    expect(current_path).to eq("/users/2")
    expect(page).to have_content("Ethan's Dashboard")
    expect(page).to have_button("Create Party")
    expect(page).to have_content("Your Top Picks:")
  end
end