# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p "destroy database"
User.destroy_all
Pin.destroy_all
Comment.destroy_all

p "delete from sqlite_sequence"
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'pins'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'comments'")


10.times do 
  user = User.create!(name: Faker::Science.scientist)
  p "user #{user.name}"
end

10.times do
  pin = Pin.create(user_id: rand(1..10), url: Faker::Internet.url)
  p "pin url #{pin.url}"
end

15.times do
  comment = Comment.create(user_id: rand(1..10), pin_id: rand(1..10), content: Faker::MichaelScott.quote)
  p "comment #{comment.content}"
end


