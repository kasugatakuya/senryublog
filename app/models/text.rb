class Text < ApplicationRecord
  belongs_to :user
  has_many :iines, dependent: :destroy
  has_many :iined_users, through: :iines, source: :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :text, uniqueness: true
  validates :text, presence: true
  validates :text,
    length: { minimum: 7, maximum: 22 }
end
