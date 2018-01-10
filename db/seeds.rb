# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Todo.delete_all
# Item.delete_all
# User.delete_all


10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'Abcd1234')

  10.times do
    todo = user.todos.create(title: Faker::Lorem.sentence)
    note = user.notes.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)

    10.times do
      todo.items.create!(name: Faker::Lorem.sentence, done: false)

      note.comments.create!(content: Faker::Lorem.paragraph, created_by: User.all.sample.id.to_s)

    end
  end


end

