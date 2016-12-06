class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@posts = Post.where(category_id: params[:id]).order(id: :desc)
		@locations = Post.all.uniq.pluck(:location)
	end
end
