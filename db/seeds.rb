# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

images = %w[https://images.pexels.com/photos/258112/pexels-photo-258112.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/1544880/pexels-photo-1544880.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/1107717/pexels-photo-1107717.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/206660/pexels-photo-206660.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/540518/pexels-photo-540518.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/3610762/pexels-photo-3610762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/230629/pexels-photo-230629.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/443446/pexels-photo-443446.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/1166209/pexels-photo-1166209.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/461956/pexels-photo-461956.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/3996435/pexels-photo-3996435.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/977736/pexels-photo-977736.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940 https://images.pexels.com/photos/131723/pexels-photo-131723.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940]

30.times do 
  Destination.create({
    name: Faker::GameOfThrones.city,
    country: Faker::Address.country,
    image_url: images.sample
  })
end


10.times do
  blogger = Blogger.create({
    name: Faker::Name.name,
    bio: Faker::Hipster.paragraph,
    age: (13..100).to_a.sample
  })

  (2..6).to_a.sample.times do 
    Post.create({
      title: Faker::Hipster.sentence(3),
      content: Faker::Hipster.paragraphs(4),
      likes: 0,
      blogger: blogger,
      destination: Destination.all.sample
    })
  end
end



# Destination.all.length.times do 
#   Destination.all.each do |destination|
#     destination.image_url = images.sample
#   end
# end