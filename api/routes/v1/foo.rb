# frozen_string_literal: true

require 'grape'

module Routes
  module V1
    # Root v1 endpoint
    class Foo < Grape::API
      namespace :foo do
        params do
          requires :name, type: String
        end
        post do
          # name param is already required in the grape endpoint
          # but it will also validate it at service level
          # check components/service/foo.rb for details
          resolve('service.foo').create(name: params[:name])
        end
      end
    end
  end
end
