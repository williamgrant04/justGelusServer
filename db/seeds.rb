# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Faker::Config.locale = 'en-GB'

#* Clients
clients = [
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 6)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 5)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 2)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 5)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 3)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 1)},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: ""},
    {name: Faker::Name.name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.phone_number, allergies: Faker::Lorem.words(number: 4)}
]

clients.each do |client|
    Client.create(client)
end

#* Services
services = [
  {name: 'Hard Gel Extensions' , price: 25, description: 'Dry manicure, nail extensions using tips/forms, coat of polish'}, 
  {name: 'Hard Gel Product Removal', price: 10, description: 'Product removal and simple manicure'}, 
  {name: 'Gel Overlay Removal + Reapplication', price: 25, description: 'Removal of previous gel overlay, reshape and reapplication of overlay, finished with gel polish and top coat'},
  {name: 'Nail Art and Bling', price: 0, description: 'Simple nail art or more extravagant and complex nail art and bling. Price varies.'},
  {name: 'Hard Gel Infills', price: 20, description: 'Removal of colour, reshape and rebalance, finished with gel polish'},
  {name: 'Gel Overlay and Gel Polish', price: 20, description: 'Dry manicure, gel overlay, finished with gel polish and top coat'},
  {name: 'Gel Overlay Removal', price: 10, description: 'Soak off product and simple manicure'}
]

services.each do |service|
  Service.create!(service)
end

#* Appointments
# appointments = [
#     {name: Faker::Name.name, date: Date.now, at_home: Faker::Boolean.boolean, client_id: Client.all.sample}
#     {name: Faker::Name.name, date: Date.now, at_home: Faker::Boolean.boolean, client_id: Client.all.sample}
#     {name: Faker::Name.name, date: Date.now, at_home: Faker::Boolean.boolean, client_id: Client.all.sample}
#     {name: Faker::Name.name, date: Date.now, at_home: Faker::Boolean.boolean, client_id: Client.all.sample}
# ]

# appointments.each do |appointment|
#     Appointment.create!(appointment)
# end