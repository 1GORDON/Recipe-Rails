class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inventories
  has_many :foods
  has_many :recipes

  # def self.recent_post(id)
  #   Post.where(user_id: id).limit(3)
  # end

  # def self.all_post(id)
  #   Post.where(user_id: id)
  # end
end
