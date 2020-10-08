require 'test_helper'

class Questions::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get questions_answers_create_url
    assert_response :success
  end

end
