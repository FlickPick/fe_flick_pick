# README

FlickPick
What is Flick Pick? </br>
It is a simple app to help friends and family pick a movie they want to watch. </br>

How it works: </br>
A logged in user with a sign-on and creates a party with the group's preferences. A code will be generated With that code guests do not need to sign-in, just need to fill in the code and name to start picking movies. After 20 movies, users come to a results page. Users will see which movies were liked and by how many of the party liked it. From there users can pick a movie, or continue through more rounds of 20.</br>

Link to: https://flick-pick-api-ab1114618897.herokuapp.com/api/v1/users/1</br>

Gems added to standard rails:</br> 
gem "bootsnap", require: false</br>
https://github.com/Shopify/bootsnap</br>
gem "faraday"</br>
https://lostisland.github.io/faraday/#/</br>
gem "sassc-rails"</br>
https://github.com/sass/sassc-rails </br>
 gem "capybara"</br>
https://teamcapybara.github.io/capybara/ </br>
 gem "launchy"</br>
https://github.com/copiousfreetime/launchy </br>
 gem "simplecov"</br>
	https://github.com/simplecov-ruby/simplecov </br>
 gem "shoulda-matchers" </br>
	https://github.com/thoughtbot/shoulda-matchers </br>
 gem "orderly"</br>
https://github.com/jmondo/orderly </br>
 gem "webmock"</br>
https://github.com/bblimke/webmock </br>
 gem "vcr"</br>
	https://github.com/vcr/vcr</br>
gem 'dotenv-rails'</br>
 https://github.com/bkeepers/dotenv</br>

gem 'omniauth'</br>
https://github.com/omniauth/omniauth </br>
gem 'omniauth-google-oauth2'</br>
gem 'omniauth-rails_csrf_protection'</br>

Contributors:
- Ethan Bustamante
  - LinkedIn: [Ethan Bustamante](https://www.linkedin.com/in/ethan-bustamante/)
  - GitHub: [ethanb1145](https://github.com/ethanb1145)

- Tommy Takahashi
  - LinkedIn: [Tommy Takahashi](https://www.linkedin.com/in/tommy-takahashi/)
  - GitHub: [ttakahashi1591](https://github.com/ttakahashi1591)
 
- Reed Hillmar
  - LinkedIn: [Reed Hillmar](https://www.linkedin.com/in/reed-hillmar/)
  - GitHub: [reedhillmar](https://github.com/reedhillmar)
 
- Joop Stark
  - LinkedIn: [Joop Stark](https://www.linkedin.com/in/joop-stark/)
  - GitHub: [JoopStark](https://github.com/JoopStark) </br>

We could have not done it without the support of: </br>
	Chris Simmons: https://www.linkedin.com/in/cjsimmons89/ </br>
	Jamison O: https://www.linkedin.com/in/jamisonordway/ </br>
	Mike Wood(with Action Cable): https://www.linkedin.com/in/michaelwilliamwood/ </br>


Architecture: 
Flickpick follows Service Oriented Architecture(SOA) as the frontend and backend are disconnected in such a way that other services could be added. If other backend services were added they would not affect the other backends. The services in the backend would not need to be coupled to each other, so if one went they would all be fine.

Install:
- In terminal(bash or zsh): </br>
git clone git@github.com:FlickPick/fe_flick_pick.git </br>
git clone git@github.com:FlickPick/be_flick_pick.git </br>
- In separate terminal move into both directories( cd fe_flick_pick…)
- In both terminals “bundle install”
- In both terminals “rails server”

The backend runs on ‘http://localhost:3000/’ which you will not need to go to
The frontend runs on ‘http://localhost:5000/’ go to that website to run the web application

Then explore

Run test:
- In terminal(bash or zsh): </br>
git clone git@github.com:FlickPick/fe_flick_pick.git </br>
git clone git@github.com:FlickPick/be_flick_pick.git </br>
- In separate terminal move into both directories( cd fe_flick_pick…)
- In the backend terminal run: “rails server”
- In the frontend terminal run: ‘bundle exec rspec” </br>

All tests should run

OAuth:

Google OAuth was set-up using OmniAuth for the response from google, and then the data was passed from the frontend to the backend to create or find the user. When created or found the backend sends a user_id to the frontend to create a session for the client. The session is how the client is logged in. 

Movie selection page: </br>
![Alt text](https://user-images.githubusercontent.com/127005060/281864606-010e8573-bf89-4251-bd05-2efecb44f9a7.png "a title")</br>
Party new page: </br>
![Alt text](https://user-images.githubusercontent.com/127005060/281865155-3b377165-6224-4f13-8a7d-acd3d2725e85.png "a title")</br>
Selection waiting room page: </br>
![Alt text](https://user-images.githubusercontent.com/127005060/281865704-d0a7675b-1687-4826-b02c-53d3a59f658f.png "a title")</br>