require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Budget', email: 'budget1234@gmail.com', password: '1234567') }

  describe 'validations' do
    it 'is valid with name, email and password' do
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
