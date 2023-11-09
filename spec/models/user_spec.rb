require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:password_digest) }
  end

  describe '.from_omniauth' do
    it 'creates a new user from OAuth response' do
      oauth_response = {
        uid: '123456',
        provider: 'google',
        info: {
          name: 'John Doe',
          email: 'john.doe@example.com'
        }
      }

      user = User.from_omniauth(oauth_response)

      expect(user).to be_a(User)
      expect(user.persisted?).to be(true)
      expect(user.name).to eq('John Doe')
      expect(user.email).to eq('john.doe@example.com')
    end

    it 'finds an existing user from OAuth response' do
      existing_user = create(:user, uid: '123456', provider: 'google')

      oauth_response = {
        uid: '123456',
        provider: 'google',
        info: {
          name: 'Jane Smith',
          email: 'jane.smith@example.com'
        }
      }

      user = User.from_omniauth(oauth_response)

      expect(user).to eq(existing_user)
      expect(user.name).to eq('Jane Smith') 
    end
  end
end