# frozen_string_literal: true

require './test/unit/helper'

FOO_ENDPOINT = '/v1/foo'

describe FOO_ENDPOINT do
  include APITest
  include MockHelper

  before do
    inject_mock!('service.foo', mock)
  end

  describe 'POST' do
    it 'responds with ok status when given correct params' do
      name = 'Alfonso Zayas'
      returned_id = 1
      foo_service_mock = resolve('service.foo')
      foo_service_mock.expects(:create).with(name: name).returns(returned_id)
      post FOO_ENDPOINT, name: name
      assert last_response.successful?
    end
  end
end
