class Salary
  attr_reader :id, 
              :type, 
              :salaries
              
  def initialize(id = "null", type = "salaries", salaries)
    @id = id
    @type = type
    @salaries = salaries
  end
end