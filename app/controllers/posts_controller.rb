class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

	def index
		@posts = Post.all.order(id: :desc).page(params[:page]).per(10)
		@locations = Post.all.uniq.pluck(:location)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to @post
		else
			flash[:danger] = @post.errors.full_messages.to_sentance
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def upvote
		@post = Post.find(params[:id])
		@post.upvote_from current_user
		redirect_to :back
	end

	def downvote
		@post = Post.find(params[:id])
		@post.downvote_from current_user
		redirect_to :back
	end

	def search
		if params[:search].blank?
			@posts = Post.all
		else
			@posts = Post.search(params)
		end
	end

	private

		def post_params
			params.require(:post).permit(:body, :location)
		end

end