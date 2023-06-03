require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  let :user do
    User.find_or_create_by(email: 'budget1234@gmail.com') do |user|
      user.name = 'Budget'
      user.password = '1234567'
      user.confirmed_at = Time.now
    end
  end

  let!(:group) { Group.create(name: 'Budget', user_id: user.id, icon: 'icon') }

  before(:each) do
    sign_in user
    visit groups_path
  end


  describe 'GET /index' do
    it 'returns a list of groups' do
      visit groups_path
      expect(page).to have_content('sign in')
    end

    it 'renders the correct path' do
      visit groups_path
      expect(page).to have_current_path(user_session_path)
    end
  end

  describe 'GET /new' do
    it 'returns a list file' do
      visit new_group_path
      expect(page).to have_content('sign in')
    end

    it 'renders the correct path' do
      visit new_group_path
      expect(page).to have_current_path(user_session_path)
    end
  end
end
