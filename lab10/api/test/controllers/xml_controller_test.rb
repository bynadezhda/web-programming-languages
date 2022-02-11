require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get xml_index_url
    assert_response :success
  end

end
