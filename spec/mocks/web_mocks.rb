# frozen_string_literal: true

require './spec/mocks/images_mock'

# Represent stub requests for conekta api
class WebMocks
  class << self
    def start
      ImagesMock.start
    end

    def stop
      ImagesMock.stop
    end
  end
end
