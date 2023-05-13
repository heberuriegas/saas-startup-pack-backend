# frozen_string_literal: true

require 'webmock'

# Add webmocks for netpay api testing
# :reek:InstanceVariableAssumption
class ImagesMock
  class << self
    include WebMock::API

    def start
      @stubs ||= []

      @stubs << stub_request(:get, 'https://images.pexels.com/photos/3785263/pexels-photo-3785263.jpeg').to_return(
        status: 200, body: '', headers: {}
      )
    end

    def stop
      @stubs ||= []
      @stubs.each do |stub|
        remove_request_stub(stub)
      end
      @stubs = []
    end
  end
end
