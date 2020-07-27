class Recipe < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :comments
	has_many :favorites
	has_many :mterials
	has_many :cooks
	accepts_nested_attributes_for :cooks, allow_destroy: true
	accepts_nested_attributes_for :mterials, allow_destroy: true
	attachment :image
end
