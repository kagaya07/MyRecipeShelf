class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  enum role: { admin: 1, customer: 2, sub_customer:3 }
  attachment :image


  validates :name,
	  uniqueness: { case_sensitive: :false },
	  length: { minimum: 2, maximum: 20 }
  validates :specialties,
	  length: { maximum: 20 }
end
