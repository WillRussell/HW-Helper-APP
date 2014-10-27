require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase


  context "GET problems#index" do
    setup { get :index }

    should render_template("index")
    should respond_with(:success)

    should "get problems" do
      assert assigns[:problems], "Should get problems"
    end
  end

  context "GET problems#show" do
    setup { get :show, id: problems(:one) }

    should render_template("show")
    should respond_with(:success)

    should "get problem" do
      assert_equal problems(:one), assigns[:problem]
    end
  end


  tegit stst 'get new is successful' do
    get :new
    assert_kind_of Problem, assigns(:problem)
    assert_response :success
  end


end