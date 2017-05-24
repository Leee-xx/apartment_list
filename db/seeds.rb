# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mining_team = %w(Happy Dopey Grumpy Sneezy Bashful Sleepy Doc Snow)
mining_team.each do |name|
  Employee.find_or_create_by(name: name)
end

# last_names = %w(Simpson Smithers Burns Leonard Carlson)
# first_names = %w(Homer Bart Marge Lisa Maggie Waylon Montgomery Lenny Carl)

# 20.times do
  # full_name = [first_names.sample, last_names.sample].join(" ")
  # puts "First or creating #{full_name}"
  # Employee.find_or_create_by(name: full_name)
# end
