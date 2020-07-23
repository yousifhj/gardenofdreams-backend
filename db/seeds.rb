# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

account = Account.create(name: 'Pathos', balance: 1000)

plant = Plant.create(account_id: 1, name: 'Marble Pathos', price: 34, kind: 'gift',  date: DateTime.now, description: 'beautiful, grren plant that will beautify a room')

plant_two = Plant.create(account_id: 1, name: 'Silver Lady', price: 40, kind: 'gifted', date: DateTime.now, description: 'gorgeous plant popular in homes and offices')
