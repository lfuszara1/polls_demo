require "test_helper"

class SecondStepOfPollsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get second_step_of_polls_new_url
    assert_response :success
  end

  test "should get create" do
    get second_step_of_polls_create_url
    assert_response :success
  end
end
