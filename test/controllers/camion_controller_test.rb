require 'test_helper'

class CamionControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get camion_view_url
    assert_response :success
  end

end
