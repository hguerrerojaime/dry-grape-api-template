# frozen_string_literal: true

require 'dry/validation'

module Contract
  # Create Foo Contract
  class CreateFoo < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
    end
  end
end
