require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get fill" do
    get pages_fill_url
    assert_response :success
  end

  test "should get result" do
    get pages_result_url
    assert_response :success
  end

end
