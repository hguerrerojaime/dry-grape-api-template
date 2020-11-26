# frozen_string_literal: true

require 'grape'
require_relative 'foo'

module Routes
  module V1
    # Root v1 endpoint
    class Root < Grape::API
      version 'v1'

      mount Foo
    end
  end
end
