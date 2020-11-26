# frozen_string_literal: true

module Constants
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  PHONE_REGEXP = /^\([0-9]{3}\)\s{1}[0-9]{7}$/.freeze
end
