# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@test.com', :password => 'farida', :password_confirmation => 'farida'
user = User.create! :name => 'Farida', :email => 'fmemon100@yahoo.com', :password => 'farida', :password_confirmation => 'farida'
user = User.create! :name => 'Alex', :email => 'fmemon100@gmail.com', :password => 'farida', :password_confirmation => 'farida'
#puts 'New user created: ' << user.name
User.all.each do |user| puts user.name end


puts 'SETTING UP DEFAULT CATEGORIES'
Category.create name: "WorldNews"
Category.create name: "Sports"
Category.create name: "Cats"
Category.create name: "Dogs"
Category.create name: "Weather"
Category.create name: "Babies"
Category.create name: "Food"
Category.create name: "Shoes"
Category.create name: "Nature"
Category.create name: "Cars"
puts 'New categories created: '
Category.all.each do |c| puts c.name end

puts 'SETTING UP DEFAULT LINKS'
Link.create url: "http://imgur.com/5LNsR", title: "Funny dog barking", user_id: 1, 
                    short_url: "http://goo.gl/sHtYr", thumbnail: "bbcT.png", promoted: true, category_id: 1
Link.create url: "http://i.imgur.com/9Nlhm.jpg", title: "Sccientific Dog", 
                   user_id: 1, short_url: "http://goo.gl/q2ZH4", thumbnail: "bestwhichT.png", promoted: true, category_id: 1
Link.create url: "http://i.imgur.com/9Nlhm.jpg", title: "Happy Cat", user_id: 1, 
                    short_url: "http://goo.gl/q2ZH4", thumbnail: "bestwhichT.png", category_id: 4
Link.create url: "http://i.imgur.com/0hzhU.jpg", title: "Wyoming Wind Sock", user_id: 1, 
                    thumbnail: "bestwhichT.png", category_id: 4                    
puts 'New Link created: '
Link.all.each do |l| puts l.title end


puts 'SETTING UP DEFAULT COMMENTS'
Comment.create commenter: "fmemon100@gmail.com", body: "Wow that is awesomw", link_id: 1
Comment.create commenter: "fmemon100@gmail.com", body: "So true", link_id: 1
Comment.create commenter: "fmemon100@yahoo.com", body: "loved the pic", link_id: 2
Comment.create commenter: "fmemon100@gmail.com", body: "get a life", link_id: 3
Comment.create commenter: "fmemon100@gmail.com", body: "Internet troll", link_id: 3
Comment.create commenter: "fmemon100@yahoo.com", body: "You should see my neighbor's cat", link_id: 3
Comment.create commenter: "fmemon100@yahoo.com", body: "I wish my dog was as smart", link_id: 1
Comment.create commenter: "fmemon100@yahoo.com", body: "Interesting", link_id: 2
puts 'Comments created'
Comment.all.each do |c| puts c.body end


puts 'SETTING UP DEFAULT VOTES'
Vote.create link_id: 1, user_id: 2, score: -1
Vote.create link_id: 1, user_id: 1, score: -1
Vote.create link_id: 2, user_id: 3, score: 1
Vote.create link_id: 3, user_id: 2, score: 1
Vote.create link_id: 4, user_id: 1, score: -1
Vote.create link_id: 2, user_id: 2, score: 1
Vote.create link_id: 4, user_id: 3, score: -1
Vote.create link_id: 4, user_id: 2, score: 1
puts 'Votes created'