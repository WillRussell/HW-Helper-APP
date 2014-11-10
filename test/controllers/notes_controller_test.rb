require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  def valid_note
    { body: 'example' }
  end

  def invalid_note_attributes
    { body: '' }
  end

  context 'POST :create' do
    context 'when I send invalid information' do
      setup { post :create,  note: invalid_note_attributes  }

      should 'render new' do
        assert_template :new
      end
    end

    context 'when I send valid information' do
      setup { post :create,  note: valid_note  }

      should 'create a new note' do
        assert_response :success
      end
    end

  end
end
