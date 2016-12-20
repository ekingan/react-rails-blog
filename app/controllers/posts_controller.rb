class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :upvote, :downvote]

	def index
		@locations  = Post.all.uniq.pluck(:location)
		if params[:location]
			@posts = Post.where(:location => params[:location]).page(params[:page]).per(10)
		else
			@posts = Post.all.order(id: :desc).page(params[:page]).per(10)
		end
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
			flash[:danger] = @post.errors.full_messages.to_sentence
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to @post
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to action: "index"
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
		@locations = Post.all.uniq.pluck(:location)
		if params[:search].blank?
			@posts = Post.all
		else
			@posts = Post.search(params)
		end
	end

	private

		def post_params
			params.require(:post).permit(:body, :location, :title, :category_id)
		end

end
