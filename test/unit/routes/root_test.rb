# frozen_string_literal: true

require './test/unit/helper'

HEALTH_CHECK_ENDPOINT = '/health_check'

describe HEALTH_CHECK_ENDPOINT do
  include APITest

  describe 'GET' do
    it 'responds with ok status when given correct params' do
      get HEALTH_CHECK_ENDPOINT
      assert last_response.successful?
      assert_equal('healthy', last_response.json_body.dig('data', 'message'))
    end
  end
end
