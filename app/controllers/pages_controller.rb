class PagesController < ApplicationController

	def topposts
		@posts = Post.highest_rated
		@locations = Post.all.uniq.pluck(:location)
	end

	def randomposts
		@posts = Post.random
		@locations = Post.all.uniq.pluck(:location)
	end


end
