require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { users(:one) }

  # should validate_presence_of(:name)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email).case_insensitive
end
