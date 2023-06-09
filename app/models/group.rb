class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :specifications

  validates :name, presence: true
  validates :icon, presence: true

  def total_spent
    specifications.sum(:amount)
  end
end
