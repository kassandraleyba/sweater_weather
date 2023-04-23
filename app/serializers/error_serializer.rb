class ErrorSerializer
  def initialize(error)
    @error = error
  end

  def serialized_json
    {
      errors: [
        {
          status: @error.status,
          messsage: @error.error_message,
          code: @error.code
        }
      ]
    }
  end
end