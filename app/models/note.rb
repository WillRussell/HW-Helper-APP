class Note < ActiveRecord::Base
  belongs_to :problem
  belongs_to :user

  validates :body, presence: true
end
