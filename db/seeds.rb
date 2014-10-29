require 'faker'

User.destroy_all
Post.destroy_all
Comment.destroy_all
#Topic.destroy_all

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

15.times do
  Topic.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
end
topics = Topic.all

50.times do 
  post = Post.create!(
    user: users.sample,
      topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )

  post.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
  post.update_rank
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    user: users.sample,
    body: Faker::Lorem.paragraph
    )
end

admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'password',
  role:     'admin'
  )

admin.skip_confirmation!
admin.save!

moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com',
  password: 'password',
  role:     'moderator' 
  )

moderator.skip_confirmation!
moderator.save!

member = User.new(
  name:   'Member User',
  email:  'member@example.com',
  password: 'password',
  )

member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"