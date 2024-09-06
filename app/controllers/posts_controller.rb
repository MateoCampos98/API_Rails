class PostsController < ApplicationController
  # GET /post
  def index 
    @posts = Post.where(published: true)
    render json: @posts, status: :ok
  end
  # GET /post/{id}
  def show 
    @posts = Post.find(params[:id])
    render json: @posts, status: :ok
  end

end