# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password")
end

50.times do |n|
  Item.create!(
    user_id: Faker::Number.between(1,20),
    name: Faker::Lorem.sentence)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
