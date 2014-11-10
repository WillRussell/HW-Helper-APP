require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should belong_to(:user)

  # should validate_presence_of(:user)
  # should validate_presence_of(:text)

  context 'a note' do
    setup do
      @user = users(:one)
      @note = Note.new(user: @user, text: 'foo')
    end
  end
end
