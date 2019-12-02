class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order("created_at DESC")
    #@all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @like = Like.new
  end

  def new 
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

 

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end
end
