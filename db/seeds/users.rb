# frozen_string_literal: true

return if User.any?

require 'devise/encryptor'

password = 'password'
%w[
  one@example.com
  two@example.com
].each { |email| User.create!(email:, password:, password_confirmation: password) }
