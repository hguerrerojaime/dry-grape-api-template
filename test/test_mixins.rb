# frozen_string_literal: true

require 'rack/test'
require 'dry/system/stubs'

module Rack
  class MockResponse
    def json_body
      JSON.parse(body)
    end
  end
end

Container.enable_stubs!

module MockHelper
  def inject_mock!(name, value)
    Container.stub(name, value)
  end

  def mock_struct(props = {})
    Struct.new(*props.keys).new(*props.values)
  end

  def unstub_injectable!(name)
    Container.unstub(name)
  end

  def unstub_injectables!
    Container.each_key { |key| unstub_injectable!(key) }
  end

  def mock_contract(params: {}, errors: {})
    contract = mock
    struct = mock_struct(errors: errors)
    struct.stubs(:to_h).returns(params)
    contract.stubs(:call).returns(struct)
    contract
  end
end

module APITest
  include Rack::Test::Methods
  include MockHelper

  def app
    Routes::Root
  end

  def resolve(component)
    Container.resolve(component)
  end
end

Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new,
  Minitest::Reporters::JUnitReporter.new('test-report'),
  Minitest::Reporters::MeanTimeReporter.new(show_progress: false, show_all_runs: false)
]
