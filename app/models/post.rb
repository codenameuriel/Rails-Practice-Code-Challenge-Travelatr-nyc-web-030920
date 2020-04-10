class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :content, length: { minimum: 100 }

  def self.sort_by_likes
    self.all.sort_by do |post|
      post.likes
    end.reverse
  end
end