class Salary
  attr_reader :id, 
              :type, 
              :salaries,
              :forecast,
              :destination
              
  def initialize(id = "null", type = "salaries", salaries, forecast, destination)
    @id = id
    @type = type
    @salaries = salaries
    @forecast = forecast
    @destination = destination
  end
end