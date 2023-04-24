class Salary
  attr_reader :id, :type, :salaries
              
  def initialize(id = "null", type = "salaries", salaries)
    @id = id
    @type = type
    @salaries = salaries
    binding.pry
  end

  def salary_info
    {
      title: @salaries[:title],
      min: @salaries[:salary_percentiles][:percentile_25].round(2),
      max: @salaries[:salary_percentiles][:percentile_75].round(2)
    }
  end
end