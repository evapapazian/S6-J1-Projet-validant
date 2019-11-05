# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

u = []
e = []
a = []
chiffre_multiple_5 = [5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100]

10.times do |index|
	u << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Name.first_name + "@yopmail.com", password: "trucbidule")
	#puts "User : #{index.first_name}" #me donne le nom de l'utilisateur créé
end

10.times do |index|
	e << Event.create(start_date: Faker::Date.forward(days: 365), duration: chiffre_multiple_5.sample, title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 10), price: rand(1..1000), location: Faker::Address.city, administrator: u.sample)
end 

10.times do |index|
	a << Attendance.create(user: u.sample, event: e.sample)
end 