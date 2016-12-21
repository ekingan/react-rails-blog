class UsersController < ApplicationController

  def post_user
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post.user }
    end
  end
end
