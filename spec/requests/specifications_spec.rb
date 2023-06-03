require 'rails_helper'

RSpec.describe 'Specifications', type: :request do
  let :user do
    User.find_or_create_by(email: 'budget1234@gmail.com') do |user|
      user.name = 'Budget'
      user.password = '1234567'
      user.confirmed_at = Time.now
    end
  end

  let(:group) { Group.create(name: 'Budget', user_id: user.id, icon: 'icon') }
  let(:specification) { Specification.create(name: 'Budget', amount: 100, author_id: user.id, group_ids: group.id) }

    before(:each) do

  #   sign_in user
    sign_in user
    get group_specifications_path(group.id)
  end

  describe 'GET /index' do

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a list of specifications' do
      expect(response.body).to include('Specifications')
    end

    it 'renders the correct path' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_group_specification_path(group.id)
      expect(response).to have_http_status(:success)
    end

    it 'returns a list file' do
      get new_group_specification_path(group.id)
      expect(response.body).to include('Specifications')
      end

    it 'renders the correct path' do
      get new_group_specification_path(group.id)
      expect(response).to render_template(:new)
    end

  end
end
