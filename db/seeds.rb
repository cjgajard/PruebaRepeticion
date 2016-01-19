# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    name: Faker::Name.name,
    email: 'test@mail.com',
    password: 'password'
  },
  {
    name: Faker::Name.name,
    email: 'test2@mail.com',
    password: 'password'
  },
  {
    name: Faker::Name.name,
    email: 'test3@mail.com',
    password: 'password'
  }
])

1.upto(6) do |i|
  Project.create(user: users.sample)
end

projects = Project.all

1.upto(projects.count * 5) do |i|
  Task.create(
    user: users.sample,
    project: projects.sample,
    status: rand(0..2)
  )
end
