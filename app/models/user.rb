class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :comments
  has_many :favorites
  enum role: { admin: 1, customer: 2, sub_customer:3 }
  attachment :image
end
