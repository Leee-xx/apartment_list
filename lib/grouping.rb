module Grouping
  GROUP_SIZE = 3
  
  def self.create_groups(employees)
    raise "Too few employees" if employees.size < GROUP_SIZE
    num_groups = (employees.size / GROUP_SIZE).to_i
    remainders = employees.size % GROUP_SIZE
    groups = []
    0.upto(num_groups - 1) do |i|
      groups[i] = employees.slice(i * GROUP_SIZE, GROUP_SIZE)
      if !remainders.zero?
        remainder = num_groups * GROUP_SIZE + i
        groups[i] << employees[remainder] if employees[remainder]
      end
    end
    
    return groups
  end
  
  # With thanks to Don Knuth / Fisher-Yates
  def self.shuffle(employees)
    (employees.size - 1).downto(1) do |i|
      j = rand(i + 1)
      employees[i], employees[j] = employees[j], employees[i]
    end
  end
end