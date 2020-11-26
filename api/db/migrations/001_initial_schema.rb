# frozen_string_literal: true

Sequel.migration do
  transaction

  up do
    create_table(:foos) do
      String :name, size: 255
    end
  end
end
