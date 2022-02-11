
require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login without signing in" do
    get root_url
    assert_redirected_to controller: :session, action: :login
  end

  test "should redirect without signing in" do
    get index_output_url, params: {num: 11}
    assert_response :redirect
  end

 
end
