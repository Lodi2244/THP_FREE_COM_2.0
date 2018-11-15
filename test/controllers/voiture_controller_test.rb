require 'test_helper'

class VoitureControllerTest < ActionDispatch::IntegrationTest
  test "should get patate" do
    get voiture_patate_url
    assert_response :success
  end

end
