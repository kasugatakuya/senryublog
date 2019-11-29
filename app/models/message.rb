class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content, presence: true
  validates :content,
    length: { minimum: 7, maximum: 22 }
end
