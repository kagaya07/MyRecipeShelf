class Recipe < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :mterials, dependent: :destroy
	has_many :cooks, dependent: :destroy

	# cook,mterialをネストしたrecipeのほうで消せるようにする。
	accepts_nested_attributes_for :cooks, allow_destroy: true
	accepts_nested_attributes_for :mterials, allow_destroy: true
	attachment :image

	validates :name, presence: true
	validates :amount, presence: true
	validates :explanation, length: { maximum: 100 }

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

    # ランキングのメソッド ファボをレシピごとに集め多い順に並べる 4つまで表示
	def self.create_ranks
		Recipe.find(Favorite.group(:recipe_id).order('count(recipe_id)desc').limit(4).pluck(:recipe_id))
	end
end
