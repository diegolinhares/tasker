# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.safe_email,
  password: 'password',
  password_confirmation: 'password'
)

list = List.create(name: Faker::Hipster.sentence)

10.times do
  list.tasks.create(
    name: Faker::Hipster.sentence,
    completed_at: Faker::Boolean.boolean(true_ratio: 0.2) ? Time.current : nil,
    creator: user
  )
end