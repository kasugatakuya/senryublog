class IinesController < ApplicationController
  def create
    @iine = current_user.iines.create(text_id: params[:text_id])
    redirect_back(fallback_location: texts_path)
  end

  def destroy
    @iine = Iine.find_by(text_id: params[:text_id], user_id: current_user.id)
    @iine.destroy
    redirect_back(fallback_location: texts_path)
  end
end
