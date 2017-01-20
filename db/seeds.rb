User.delete_all

users = 20.times.map do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: 'p123'
    )
end