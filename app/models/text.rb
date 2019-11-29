class Text < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
  validates :text,
    length: { minimum: 7, maximum: 22 }
end
