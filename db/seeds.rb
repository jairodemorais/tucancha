# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#admin_user = User.create!(email: "test@test.com",
                         #password: "12345678",
                         #password_confirmation: "12345678")


admin_user = Appointment.create!(date: Time.new,
                         hour: "22",
                         place: "El campito")
