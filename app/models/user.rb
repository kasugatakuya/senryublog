class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  
  has_many :texts, dependent: :destroy
  has_many :iines, dependent: :destroy
  has_many :iined_texts, through: :iines, source: :text

  has_many :messages


  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_iined?(text)
    self.iines.exists?(text_id: text.id)
  end

end
