# README

This is a command-line tool to create random groups of between 3 and 5 (well, 3 and 4) people
from all employees in the database.

Run it thusly:
rails runner -f scripts/family_friday.rb

Options:
-a "SOME NAME"
Adds a new Employee with the name SOME NAME

--no-group
Disables the grouping function (e.g. if you only want to add a user)

* Ruby version
ruby 2.2

* Rails version
Rails 5.0.3

* Database initialization
rake db:migrate
rake db:seed

* How to run the test suite
Only one test to worry about right now:
rake spec SPEC=spec\lib\grouping_spec.rb
