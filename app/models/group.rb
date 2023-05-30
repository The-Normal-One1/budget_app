class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :specifications

  validates :name, presence: true
  validates :icon, presence: true

  private

  def total_amount
    specifications.sum(:amount)
  end
end
