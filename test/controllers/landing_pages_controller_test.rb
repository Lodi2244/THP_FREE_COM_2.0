require 'test_helper'

class LandingPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get basic" do
    get landing_pages_basic_url
    assert_response :success
  end

  test "should get startup" do
    get landing_pages_startup_url
    assert_response :success
  end

  test "should get lyon" do
    get landing_pages_lyon_url
    assert_response :success
  end

end
