class Destination < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :bloggers, through: :posts


  def most_recent
     last_five = self.posts.last(5)
 end 

 def most_likes
  self.posts.max_by do |post|
    post.likes
  end
end

def average_age
  age_array = []
   self.posts.each do |post| 
  age_array <<  post.blogger.age   
  end
 average = age_array.inject(0.0) { |sum, el| sum + el } / age_array.size 
end 

end
