# frozen_string_literal: true

module Dao
  # Foo Data Access Object
  class Foo
    include Import[
      database: :database
    ]

    def create(params)
      database[:foos].insert(name: params[:name])
    end
  end
end
