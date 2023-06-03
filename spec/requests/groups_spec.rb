require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let :user do
    User.find_or_create_by(email: 'budget1234@gmail.com') do |user|
      user.name = 'Budget'
      user.password = '1234567'
      user.confirmed_at = Time.now
    end
  end

    before(:each) do

  #   sign_in user
    sign_in user
    get groups_path
  end

  describe 'GET /index' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of groups' do
      expect(response.body).to include('Categories')
    end

    it 'renders the correct path' do
      expect(response).to render_template(:index)
    end 
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_group_path
      expect(response).to have_http_status(:success)
    end

    it 'returns a list file' do
      get new_group_path
      expect(response.body).to include('Add Category')
      end

    it 'renders the correct path' do
      get new_group_path
      expect(response).to render_template(:new)
    end

  end
end
