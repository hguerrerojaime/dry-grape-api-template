# frozen_string_literal: true

require_relative '../test_helper'

Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new,
  Minitest::Reporters::JUnitReporter.new('integration-test-report'),
  Minitest::Reporters::MeanTimeReporter.new(show_progress: false, show_all_runs: false)
]
