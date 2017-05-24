class Employee < ApplicationRecord
  validates :name, uniqueness: true
end
