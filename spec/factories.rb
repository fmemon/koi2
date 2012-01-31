require 'factory_girl'

Factory.define :user do |u|
  u.name 'First User'
  u.email 'user@test.com'
  u.password 'farida'
  u.password_confirmation 'farida'
end

