require 'rails_helper'

RSpec.describe Group, type: :model do

  let(:user) { User.create(name:'Budget', email: 'budget1234@gmail.com', password: '1234567') } 
  let(:group) { Group.create(name: 'Budget', user_id: user.id, icon: 'icon') }

  describe 'validations' do
    it 'is valid with name and icon' do
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'is not valid without a user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end

    it 'should not be valid wthout icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end    
end
