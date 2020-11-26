# frozen_string_literal: true

require 'dry/system/stubs'
require_relative '../test_helper'

Container.enable_stubs!

module MockHelper
  def inject_mock!(name, value)
    Container.stub(name, value)
  end

  def mock_struct(props = {})
    Struct.new(*props.keys).new(*props.values)
  end

  def mock_contract(params: {}, errors: {})
    contract = mock
    struct = mock_struct(errors: errors)
    struct.stubs(:to_h).returns(params)
    contract.stubs(:call).returns(struct)
    contract
  end
end

Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new,
  Minitest::Reporters::JUnitReporter.new('test-report'),
  Minitest::Reporters::MeanTimeReporter.new(show_progress: false, show_all_runs: false)
]
