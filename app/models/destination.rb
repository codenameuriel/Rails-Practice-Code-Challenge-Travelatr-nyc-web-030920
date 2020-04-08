class Destination < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :bloggers, through: :posts
end
