require 'factory_girl'

Factory.define :user do |u|
  u.name 'First User'
  u.email 'user@test.com'
  u.password 'farida'
  u.password_confirmation 'farida'
end

Factory.define :link do |l|
  l.url 'http://www.GOogle.com'
  l.title 'Funny dog barking II'
  l.user_id 1
  l.thumbnail "bbcT.png"
  l.category_id 1
end