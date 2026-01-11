require "test_helper"

class Company::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_dashboard_index_url
    assert_response :success
  end
end
