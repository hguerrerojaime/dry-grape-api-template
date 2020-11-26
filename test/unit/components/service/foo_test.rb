# frozen_string_literal: true

require './test/unit/helper'
require './api/components/service/foo'

FooService = Service::Foo

describe FooService do
  include MockHelper

  before do
    inject_mock!('dao.foo', mock)
    @service = FooService.instance
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
