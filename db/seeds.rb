# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def status_message(title)
  puts "=" * 75
  puts title
  puts "=" * 75
end

# add an admin if non exists
if User.admins.size.zero?

  status_message "Adding an admin"

  User.create(
    first_name: "Admin",
    last_name: "McAdmin",
    email: "admin@mcddmin.com",
    password: "123456",
    admin: true
  )

else
  status_message "No admin added since one already exists"
end
