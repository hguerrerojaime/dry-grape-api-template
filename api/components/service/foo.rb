# frozen_string_literal: true

module Service
  # Foo Data Access Object
  class Foo
    extend BusinessClass
    include Singleton
    include Import[
      foo_dao: 'dao.foo'
    ]

    # This wraps the method into a proxy and runs the contract validation first
    # if the validation is successful it will enter this method
    # create_foo is a contract defined in the contracts directory
    service_method contract: 'create_foo'
    def create(params)
      foo_dao.create(name: params[:name])
    end
  end
end
