# frozen_string_literal: true

require './api/lib/import'

FOO_LIST = [
  { name: 'bar' }
].freeze

Sequel.seed do
  include Import[:database]

  def run
    database.transaction do
      FOO_LIST.each { |record| database[:foos].insert(record) }
    end
  end
end
