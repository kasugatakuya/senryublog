class TextsController < ApplicationController
  def index
    @texts = Text.all.order(id: "DESC").page(params[:page]).per(5)
    @iine = Iine.new
  end

  def new
    @text = Text.new
    
  end

  def show
    @text = Text.find(params[:id])
    @iine = Iine.new
    @comments = @text.comments
    @comment = Comment.new
  end

  def create
    Text.create(text_params)
    redirect_to texts_path(current_user)
  end

  def edit
    @text = Text.find_by(id: params[:id])
  end
  def update
    # binding.pry
    @text = Text.find_by(id: params[:id])
    @text.update(text_params)
    redirect_to text_path(id: @text.id)
  end

  def destroy
    @text = Text.find_by(id: params[:id], user_id: current_user.id)
    @text.destroy
    flash.now[:alert] = "投稿を削除しました"
    redirect_to texts_path
  end

  private
  def text_params
    params.require(:text).permit(:text).merge(user_id: current_user.id)
  end
end
