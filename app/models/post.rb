class Post < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :text, presence: true
end
