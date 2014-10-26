class Problem < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  belongs_to :user


  def unanswered
    where (solved: :false)
  end

  def answered
    where (solved: :true)
  end

end
