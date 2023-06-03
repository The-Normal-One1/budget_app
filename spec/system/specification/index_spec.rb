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
      let!(:specification) { Specification.create(name: 'Budget', amount: 100, author_id: user.id, group_ids: group.id) }
        
        before(:each) do
            sign_in user
            visit group_specifications_path(group.id)
        end


    describe 'GET /index' do
        it 'returns a list of specification' do
            visit group_specifications_path(group.id)
          expect(page).to have_content('sign in')
        end
    
        it 'renders the correct path' do
            visit group_specifications_path(group.id)
          expect(page).to have_current_path(user_session_path)
        end 
      end

        describe 'GET /new' do
            it 'returns a list file' do
                visit group_specifications_path(group.id)
              expect(page).to have_content('sign in')
              end
        
            it 'renders the correct path' do
                visit group_specifications_path(group.id)
              expect(page).to have_current_path(user_session_path)
            end
        
          end
end