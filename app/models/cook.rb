class Cook < ApplicationRecord
	belongs_to :recipe
	attachment :image
end
