# Include methods to make HTTP specs easier to work with.
module RequestHelpers
  def response_json
      json = JSON.parse(response.body)
  end
end
