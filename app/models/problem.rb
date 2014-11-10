class Problem < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  belongs_to :user
<<<<<<< HEAD
=======
  delegate :name, :email, :to => :user, :prefix => true
>>>>>>> 58c4b9252aa69af4c3c8195e9ea18a5e9182f0ec
end
