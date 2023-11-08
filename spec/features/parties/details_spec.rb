require "rails_helper"

feature "After movie selection there is a details page" do
  it "will display a form" do

    WebMock.allow_net_connect! 
    WebMock.disable! 
    VCR.eject_cassette 
    VCR.turn_off!(:ignore_cassettes => true)

    joop_login

    visit "/parties/111222333444/details"

    expect(page).to have_content("is played by")
    expect(page).to have_link("See trailer on Youtube")
  end
end