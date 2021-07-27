# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(username: "hostess", password: "password0", password_confirmation: "password0", user_type: 0)
User.create(username: "admin", password: "password1", password_confirmation: "password1", user_type: 1)

Reservation.destroy_all

Reservation.create(
  first_name: "Adam",
  last_name: "Adamson",
  email: "adam@email.com",
  phone_number: "0412345678",
  time: (Time.now + 1.day),
  pax: 2, code: "123",
  confirmed: true,
)

Reservation.create(
  first_name: "Betty",
  last_name: "Boop",
  email: "betty@email.com",
  phone_number: "0422345678",
  time: (Time.now + 1.day),
  pax: 3, code: "223",
  confirmed: true,
)

Reservation.create(
  first_name: "Charlie",
  last_name: "Cumberbatch",
  email: "charlie@email.com",
  phone_number: "0432345678",
  time: (Time.now + 1.day),
  pax: 4,
  code: "323",
  confirmed: true,
)

Reservation.create(
  first_name: "Test",
  last_name: "Test",
  email: "test@email.com",
  phone_number: "0400030000",
  time: (Time.now + 1.hours),
  pax: 4,
  code: "415",
  confirmed: true,
)

Reservation.create(
  first_name: "Test2",
  last_name: "Test2",
  email: "test2@email.com",
  phone_number: "0400000500",
  time: (Time.now + 2.hours),
  pax: 4,
  code: "431",
  confirmed: true,
)

Reservation.create(
  first_name: "Test3",
  last_name: "Test3",
  email: "test3@email.com",
  phone_number: "0480000000",
  time: (Time.now + 3.hours),
  pax: 4,
  code: "404",
  confirmed: true,
)
