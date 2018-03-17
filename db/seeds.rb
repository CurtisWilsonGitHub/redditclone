# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

#create Posts
Post.find_or_create_by!(title:"First Post Title", body:"First Post Body")


#creates users
 5.times do
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
 end
 users = User.all

#creates topics
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all

#creates posts
50.times do
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all

#Create Comments
Comment.find_or_create_by!( body:"First Comment Body")
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end
comments = Comment.all

#create a admin
admin = User.create!(
    name: "Admin User",
    email: "admin@example.com",
    password: 'helloworld',
    role: 'admin'
)

#create a member
member = User.create!(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld'
)

#create a moderator
moderator = User.create!(
    name: "Moderator User",
    email: 'moderator@example.com',
    password: 'helloworld',
    role: 'moderator'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
