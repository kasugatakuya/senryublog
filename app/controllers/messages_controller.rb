class MessagesController < ApplicationController
  before_action :set_post

  def index
    @message = Message.new
    @messages = @post.messages.includes(:user)
  end

  def create
    @message = @post.messages.new(message_params)
    if @message.save
      redirect_to post_messages_path(@post)
    else
      @messages = @post.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end