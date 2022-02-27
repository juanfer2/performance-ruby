# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

file = File.read('users_mock_data.json')
users_mock_data = JSON.parse(file)

users_mock_data.map do |user|
  puts '***********Start create*********'
  puts user
  User.create(user)
  puts '***********End create*********'
end
