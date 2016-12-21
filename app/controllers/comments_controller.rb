class CommentsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @comments = Comment.where(post_id: params[:post_id])
    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end
  end
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    if @comment.save
      redirect_to :back, notice: "Your comment was successfully posted!"
    else
      redirect_to :back, notice: "Your comment was not posted"
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
		redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end

end
