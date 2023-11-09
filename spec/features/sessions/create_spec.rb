require "rails_helper"

feature "User can login" do
  it "User can log in" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    visit "/"

    expect(page).to have_content("Not logged in")

    click_link "Sign in"

    fill_in "Email", with: "joop@turing.edu"
    fill_in "Password", with: "Joop!12345"

    click_button "Log in"
    
    visit "/"

    expect(page).to have_content("Logged in as: Joop")
  end

  it "User cannot log in, with bad password" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    visit "/"

    expect(page).to have_content("Not logged in")
    
    click_link "Sign in"
    
    fill_in "Email", with: "joop@turing.edu"
    fill_in "Password", with: "Wrong"
    
    click_button "Log in"
    
    expect(page).to have_content("Log in")

    visit "/"

    expect(page).to have_content("Not logged in")
  end

  it "users can log out" do
    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    joop_login

    expect(page).to have_content("Log out")
    
    click_link "Log out"
    
    expect(page).to have_content("Sign in")
  end


end