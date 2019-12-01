class Api::MessagesController < ApplicationController
  def index
    @post = Post.find(params[:post_id]) 
    @messages = @post.messages.includes(:user).where('id > ?', params[:last_id])
  end
end