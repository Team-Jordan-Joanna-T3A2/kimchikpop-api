# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(username: "hostess", password: "pasword0", user_type: 0)
User.create(username: "admin", password: "password1", user_type: 1)

Reservation.destroy_all

Reservation.create(first_name: "Adam", last_name: "Adamson", email: "adam@email.com", phone_number: "0412345678", time: (Time.now + 1.day), pax: 2, code: "123", confirmed: true)
Reservation.create(first_name: "Betty", last_name: "Boop", email: "betty@email.com", phone_number: "0422345678", time: (Time.now + 1.day), pax: 3, code: "223", confirmed: true)
Reservation.create(first_name: "Charlie", last_name: "Cumberbatch", email: "charlie@email.com", phone_number: "0432345678", time: (Time.now + 1.day), pax: 4, code: "323", confirmed: true)
