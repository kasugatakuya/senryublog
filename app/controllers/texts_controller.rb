class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
    Text.create(text_params)
    redirect_to texts_path(current_user)
  end

  private
  def text_params
    params.require(:text).permit(:text).merge(user_id: current_user.id)
  end
end
