module TestHelperMethods
  def parsed_body
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include TestHelperMethods, type: :request
end
