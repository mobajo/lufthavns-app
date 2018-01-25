require 'test_helper'

class DeparturesControllerTest < ActionDispatch::IntegrationTest
  test "should get arrivals" do
    get departures_arrivals_url
    assert_response :success
  end

end
