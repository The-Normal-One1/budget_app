class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups
  has_many :specifications, foreign_key: "author_id"

  validates :name, presence: true, length: { minimum: 2, maximum: 45, message: "must be between 2 and 20 characters" }
  validates :email, presence: true, length: { maximum: 255, message: "must be less than 255 characters" }
  validates :password, presence: true, length: { minimum: 6, maximum: 20, message: "must be between 6 and 20 characters" }
end
