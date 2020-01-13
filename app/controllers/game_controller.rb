class GameController < ApplicationController
  def step1
  end

  def step2
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def step3
    @all_ranks = Text.find(Iine.group(:text_id).order('count(text_id) desc').limit(5).pluck(:text_id))
  end

  def step4
    @posts = Post.all.order(:id)
  end

  def step5
    @texts = Text.all.order(:id)
  end

  def step6
    @all_ranks = Text.find(Iine.group(:text_id).order('count(text_id) desc').limit(5).pluck(:text_id))
  end

  def step7
    @all_ranks = Text.find(Iine.group(:text_id).order('count(text_id) desc').limit(5).pluck(:text_id))
  end

end
