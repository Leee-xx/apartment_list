require "grouping"
require 'byebug'
require 'rails_helper'

describe Grouping do
  def random_name
    last_names = %w(Simpson Smithers Burns Leonard Carlson)
    first_names = %w(Homer Bart Marge Lisa Maggie Waylon Montgomery Lenny Carl)
    return [first_names.sample, last_names.sample].join(" ")
  end
  
  def make_employee
    name = random_name()
    suffix = 'I'
    employee = nil
    while employee.nil?
      begin
        employee = Employee.create!(name: name)
        break
      rescue
        suffix += 'I'
        name = (name.split(' ') << suffix).join(' ')
      end
    end
    employee
  end
  
  describe "for total number of employees" do
    let(:employees) { 3.times.map { make_employee } }
    it "should succeed if >= 3" do
      3.times do
        groups = Grouping.create_groups(employees)
        expect(groups).to be_instance_of(Array)
        expect(groups.size).to be > 0
        expect(groups.size).to eq(groups.compact.size)
        expect(groups.detect {|group| group.size < 3 || group.size > 5}).to be_nil
        employees << make_employee()
      end
    end
    
    it "should fail if < 3" do
      3.times do
        expect { Grouping.create_groups(Employee.all) }.to raise_error("Too few employees")
        make_employee()
      end
    end
  end
end