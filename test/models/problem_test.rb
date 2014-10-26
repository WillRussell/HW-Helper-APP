require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  context "a problem" do
    subject { problems(:one) }
    setup do
      @problem = problems(:one)
    end

    should "should know if it has been solved" do
      refute problems(:one).solved
    end

  end
end
