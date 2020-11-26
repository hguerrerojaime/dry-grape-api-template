# frozen_string_literal: true

require 'rack/test'

module Rack
  class MockResponse
    def json_body
      JSON.parse(body)
    end
  end
end

module APITest
  include Rack::Test::Methods

  def app
    Routes::Root
  end

  def resolve(component)
    Container.resolve(component)
  end
end
