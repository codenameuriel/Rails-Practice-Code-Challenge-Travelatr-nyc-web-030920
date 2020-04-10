class Blogger < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 31 }

 
  def most_liked_post
    self.posts.max_by do |post|
      post.likes
    end
  end

  def top_five_destinations
      self.destinations.uniq.sort_by do |destination| 
        destination.posts.count 
      end.last(5)
  end  

  def sort_by_likes
    self.posts.sort_by do |post|
      post.likes 
    end.reverse
  end
end