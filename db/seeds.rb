# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Slavkis",
email: "slavkis@slavkis.world",
password: "password",
password_confirmation: "password",
admin: true,
checkbox: true)
99.times do |n|
name = Faker::Name.name
email = "mail#{n+1}@slavkis.world"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password,
checkbox: true)

end