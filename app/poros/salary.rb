class Salary
  attr_reader :id, :type, :salaries
              
  def initialize(id = "null", type = "salaries", salaries)
    @id = id
    @type = type
    @salaries = salaries
    # binding.pry
  end

  def salary_info
    salaries = @salaries[:salaries].map do |salary|
      {
        title: salary[:job][:title],
        min: salary[:salary_percentiles][:percentile_25].round(2),
        max: salary[:salary_percentiles][:percentile_25].round(2)
      }
    end
    salaries
    binding.pry
    # maybe put this in facade?
  end
end