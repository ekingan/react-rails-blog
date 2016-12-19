class Post < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :comments

	acts_as_votable

	def self.highest_rated
		order(cached_votes_score: :desc).limit(20)
	end

	def self.random
		limit(5).order("RANDOM()")
	end

	def self.search(params)
		posts = Post.where("body LIKE ?", "%#{params[:search]}%") if params[:search].present?
		posts
	end

end
