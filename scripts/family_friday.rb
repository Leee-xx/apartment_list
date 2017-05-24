require "grouping"
require 'optparse'

options = {
  group: true
}
OptionParser.new do |opts|
  opts.banner = "Usage: $0 [options]"

  opts.on("-a", "--add [name]", "Add a new employee by name") do |name|
    options[:employee_name] = name
  end
  
  opts.on("-g", "--[no-]group", "Split employees up into randomized groups") do |g|
    options[:group] = g
  end

end.parse!

if options[:employee_name]
  begin
    Employee.find_or_create_by!(name: options[:employee_name])
  rescue => ex
    puts "Couldn't create employee #{options[:employee_name]}: #{ex.message}"
  end
end

if options[:group]
  employees = Employee.all.to_a
  Grouping.shuffle(employees)
  groups = Grouping.create_groups(employees)
  puts "Here are your groups:"
  groups.each_with_index do |group, i|
    puts "Group #{i + 1}:"
    group.each {|employee| puts " - #{employee.name}" }
  end
end