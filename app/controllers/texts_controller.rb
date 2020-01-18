class TextsController < ApplicationController
  def index
    @texts = Text.all.order(id: "DESC")
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
    @all_ranks = Text.find(Iine.group(:text_id).order('count(text_id) desc').limit(5).pluck(:text_id))
  end

  def destroy
    @text = Text.find_by(id: params[:id], user_id: current_user.id)
    @text.destroy
    redirect_to texts_path
  end

  private
  def text_params
    params.require(:text).permit(:text).merge(user_id: current_user.id)
  end
end
