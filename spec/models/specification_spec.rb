require 'rails_helper'

RSpec.describe Specification, type: :model do
  let(:user) { User.create(name: 'Budget', email: 'budget1234@gmail.com', password: '1234567') }
  let(:group) { Group.create(name: 'Budget', user_id: user.id, icon: 'icon') }
  let(:specification) { Specification.create(name: 'Budget', amount: 100, author_id: user.id, group_ids: group.id) }

  describe 'validations' do
    it 'is valid with name and amount' do
      expect(specification).to be_valid
    end

    it 'is not valid without a name' do
      specification.name = nil
      expect(specification).to_not be_valid
    end

    it 'is not valid without an amount' do
      specification.amount = nil
      expect(specification).to_not be_valid
    end

    it 'is not valid without a user_id' do
      specification.author_id = nil
      expect(specification).to_not be_valid
    end
  end
end
