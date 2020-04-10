class Destination < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :bloggers, through: :posts

  def most_recent
    self.posts.last(5)
  end 

 def most_likes
  self.posts.max_by do |post|
    post.likes
  end
end

def unique_bloggers
  self.bloggers.uniq
end

def average_age_of_bloggers
  # ages = []
  # unique_bloggers.each do |blogger| 
  #   ages <<  blogger.age   
  # end
  # ages.inject(0.0) { |sum, el| sum + el } / ages.size 

  unique_bloggers.reduce(0.0) do |memo, blogger|
    memo += blogger.age
  end / unique_bloggers.length
end 

end
