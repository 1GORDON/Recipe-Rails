class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :inventories, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  validates :name, presence: true
end
