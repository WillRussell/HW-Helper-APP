class Problem < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  belongs_to :user
  delegate :name, :email, :to => :user, :prefix => true
end
