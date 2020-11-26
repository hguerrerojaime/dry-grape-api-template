# frozen_string_literal: true

require './test/integration/helper'

SUBJECT_ENDPOINT = '/v1/foo'

describe SUBJECT_ENDPOINT do
  include APITest

  describe 'POST' do
    it 'responds with ok status when given correct params' do
      name = 'Alfonso Zayas'
      post SUBJECT_ENDPOINT, name: name
      assert last_response.successful?
    end
  end
end
