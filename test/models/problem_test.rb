require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  context "a problem" do
    subject { problems(:one) }
    setup do
      @problem = problems(:one)
    end

    should "should know if it has been solved" do
      assert problems(:solved).solved?
      refute problems(:unsolved).solved?
    end

    should "should know if it has not been solved" do
      assert problems(:unsolved).unsolved?
      refute problems(:solved).unsolved?
    end
  end
end
