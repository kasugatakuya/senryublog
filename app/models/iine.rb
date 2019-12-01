class Iine < ApplicationRecord
  belongs_to :text
  belongs_to :user

  validates_uniqueness_of :text_id, scope: :user_id
end
