class PagesController < ApplicationController

	def topposts
		@posts = Post.highest_rated
	end

	def randomposts
		@posts = Post.random
		@locations = Post.all.uniq.pluck(:location)
	end


end
