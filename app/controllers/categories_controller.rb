class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@posts = Post.where(category_id: params[:id]).order(id: :desc)
		@locations = Post.all.uniq.pluck(:location)
	end

	def post_category
		@post = Post.find(params[:id])
		respond_to do |format|
			format.json { render json: @post.category }
		end
	end
end
