class Specification < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true,
                     numericality: { only_float: true, greater_than_or_equal_to: 0.00,
                                     message: 'Please enter a valid amount' }

  validates :groups, presence: true, length: { minimum: 1, message: 'Please select at least one group' }
end
