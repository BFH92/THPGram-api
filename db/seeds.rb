# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.times do 
  user = User.create!( 
    name: Faker::Name.first_name,
    email: "a@a.com",
    password:'azerty'
  )
end
1.times do 
 user = User.create!( 
   name: Faker::Name.first_name,
   email: "b@b.com",
   password:'azerty'
 )
end 
29.times do 
  post = Post.create!( 
    description:Faker::Lorem.paragraph,
    user_id: [*1..2].sample,
    is_private: false
  )
  post.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/insta.jpg')), filename: 'insta.jpg')
end
1.times do 
  post = Post.create!(
    description:Faker::Lorem.paragraph,
    user_id: 1,
    is_private: true
  
  )
  post.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/insta.jpg')), filename: 'insta.jpg')
end

10.times do
  comment = Comment.create!(
    content: Faker::Lorem.paragraph, 
    user_id: [*1..2].sample,
    post_id: [*1..3].sample,
  )
end