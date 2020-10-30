# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying existing seeds"

Follow.destroy_all
PostTag.destroy_all
UserPost.destroy_all
Tag.destroy_all
Post.destroy_all
User.destroy_all

puts "Seeding Data"

puts "Seeding Users"

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        password: '123',
        email: Faker::Internet.safe_email,
        bio: Faker::Lorem.paragraph,
        location: Faker::Address.city,
        image_url: Faker::LoremFlickr.colorized_image
    )
end

User.create(
    first_name: 'Jeff',
    last_name: 'Jenkins',
    username: 'jjenkins120',
    password: '123',
    email: 'jjenkins120@gmail.com',
    bio: Faker::Lorem.paragraph,
    location: Faker::Address.city,
    image_url: Faker::LoremFlickr.colorized_image
)

puts "Seeding Posts w/o posts"

cate_arr = ['video', 'audio', 'image', 'writing']

10.times do
    Post.create(
        title: Faker::App.name,
        description: Faker::Lorem.sentence,
        link_url: Faker::Internet.url,
        user_id: User.all.sample.id,
        likes: rand(1..100), 
        category: cate_arr.sample
    )
end

puts "Seeding Posts w/ posts"
# with post ids
10.times do
    Post.create(
        title: Faker::App.name,
        description: Faker::Lorem.sentence,
        link_url: Faker::Internet.url,
        user_id: User.all.sample.id,
        post_id: Post.all.sample.id, 
        likes: rand(1..100),
        category: cate_arr.sample
    )
end

puts "Seeding Tags"

tags = ['beautiful', 'dark', 'bright', 'interesting', 'creative', 'deep', 'lovely']

10.times do
    Tag.create(
        name: tags.sample
    )
end

puts "Seeding Follows"

10.times do 
    Follow.create(
        follower_id: User.all.sample.id,
        following_id: User.all.sample.id,
    )
end

puts "Seeding User_posts"

10.times do 
UserPost.create(
    post_id: Post.all.sample.id,
    user_id: User.all.sample.id,
)
end

puts "Seeding Post_tags "

10.times do 
PostTag.create(
    post_id: Post.all.sample.id,
    tag_id: Tag.all.sample.id,
)
end

puts "Done!"