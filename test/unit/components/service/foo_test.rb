# frozen_string_literal: true

require './test/test_helper'
require './api/components/service/foo'

FooService = Service::Foo

describe FooService do
  include MockHelper

  before do
    @service = FooService.new(foo_dao: mock)
  end

  # Important to disable mocks after each test
  after do
    unstub_injectables!
  end

  describe 'register' do
    it 'raises exception when invalid parameters are given' do
      inject_mock!('contract.create_foo', mock_contract(errors: { name: %w[required] }))
      assert_raises(Exceptions::ValidationException) { @service.create({}) }
    end

    it 'must return an id when right parameters are given' do
      params = {
        name: 'Alfonso Zayas'
      }
      inject_mock!('contract.create_foo', mock_contract(params: params))
      mock_id = 1
      @service.foo_dao.expects(:create).with(params).returns(mock_id)
      assert_equal(1, @service.create(params))
    end
  end
end
