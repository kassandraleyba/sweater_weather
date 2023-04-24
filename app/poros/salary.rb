class Salary
  attr_reader :id, 
              :type, 
              :salaries,
              :forecast
              
  def initialize(id = "null", type = "salaries", salaries, forecast)
    @id = id
    @type = type
    @salaries = salaries
    @forecast = forecast
  end
end