# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 3
)

Flat.create!(
  name: 'Beautiful 2 rooms appartment',
  address: '5 westbourne street London W3 2GF',
  description: 'Cosy and spacious flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 95,
  number_of_guests: 5
)

Flat.create!(
  name: 'Heaven right in city center',
  address: '9 grassland road London W9 1DT',
  description: 'Large living area, king size bed, very well located',
  price_per_night: 100,
  number_of_guests: 2
)

# Faker

require 'faker'

puts 'Creating 100 fake flat...'
100.times do
  flat = Flat.new(
    name: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph,
    price_per_night: Faker::Number.between(from: 50, to: 200),
    number_of_guests: Faker::Number.between(from: 2, to: 10),
  )
  flat.save!
end
puts 'Finished!'
