# README

FlickPick
What is Flick Pick?
It is a simple app to help friends and family pick a movie they want to watch. 

How it works:
A logged in user with a sign-on and creates a party with the group's preferences. A code will be generated With that code guests do not need to sign-in, just need to fill in the code and name to start picking movies. After 20 movies, users come to a results page. Users will see which movies were liked and by how many of the party liked it. From there users can pick a movie, or continue through more rounds of 20.

Link to: https://flick-pick-api-ab1114618897.herokuapp.com/api/v1/users/1

Gems added to standard rails:
gem "bootsnap", require: false
https://github.com/Shopify/bootsnap
gem "faraday"
https://lostisland.github.io/faraday/#/
gem "sassc-rails"
https://github.com/sass/sassc-rails 
 gem "capybara"
https://teamcapybara.github.io/capybara/ 
 gem "launchy"
https://github.com/copiousfreetime/launchy 
 gem "simplecov"
	https://github.com/simplecov-ruby/simplecov 
 gem "shoulda-matchers"
	https://github.com/thoughtbot/shoulda-matchers 
 gem "orderly"
https://github.com/jmondo/orderly 
 gem "webmock"
https://github.com/bblimke/webmock 
 gem "vcr"
	https://github.com/vcr/vcr
gem 'dotenv-rails'

gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'


We could have not done it without the support of:
	Chris Simmons: https://www.linkedin.com/in/cjsimmons89/ 
	Jamison O: https://www.linkedin.com/in/jamisonordway/ 
	Mike Wood(with Action Cable): https://www.linkedin.com/in/michaelwilliamwood/ 


Architecture: 
Flickpick follows Service Oriented Architecture(SOA) as the frontend and backend are disconnected in such a way that other services could be added. If other backend services were added they would not affect the other backends. The services in the backend would not need to be coupled to each other, so if one went they would all be fine.

Install:
-In terminal(bash or zsh):
git clone git@github.com:FlickPick/fe_flick_pick.git
git clone git@github.com:FlickPick/be_flick_pick.git
-In separate terminal move into both directories( cd fe_flick_pick…)
-In both terminals “bundle install”
-In both terminals “rails server”

The backend runs on ‘http://localhost:3000/’ which you will not need to go to
The frontend runs on ‘http://localhost:5000/’ go to that website to run the web application

Then explore

Run test:
-In terminal(bash or zsh):
git clone git@github.com:FlickPick/fe_flick_pick.git
git clone git@github.com:FlickPick/be_flick_pick.git
-In separate terminal move into both directories( cd fe_flick_pick…)
-In the backend terminal run: “rails server”
-In the frontend terminal run: ‘bundle exec rspec” 
All tests should run

OAuth:

Google OAuth was set-up using OmniAuth for the response from google, and then the data was passed from the frontend to the backend to create or find the user. When created or found the backend sends a user_id to the frontend to create a session for the client. The session is how the client is logged in. 
