# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'First User', :email => 'user@test.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
Link.create url: "http://imgur.com/5LNsR", title: "Funny dog barking", user_id: 1, short_url: "http://goo.gl/sHtYr", thumbnail: "bbcT.png", promoted: true, category: "worldnews"
Link.create url: "http://i.imgur.com/9Nlhm.jpg", title: "Sccientific Dog", user_id: 1, short_url: "http://goo.gl/q2ZH4", thumbnail: "bestwhichT.png", promoted: nil, category: "funnies"