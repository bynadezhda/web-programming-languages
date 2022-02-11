require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  # test "should get input" do
  #   get index_input_url
  #   assert_response :success
  # end

  # test "should get output" do
  #   get index_output_url
  #   assert_response :success
  # end

  # test "should return result if params are numbers" do
  #   get index_output_url, params: { n: '10', sequence:'2 4 16 5 7 25 64 81 9 3' }
  #   assert_response :success
  #   assert_nil assigns[:error]
  #   assert_equal [[4, 16], [25, 64, 81, 9]], assigns[:result]
  # end

  # test "should return error if has not number" do
  #   get index_output_url, params: { n: '10', sequence:'2 4 nk 5 7 25 64 81 9 3' }
  #   assert_response :success
  #   assert_not_nil assigns[:error]
  #   assert_nil assigns[:result]
  # end

  # test "should return error if number entered does not match n" do
  #   get index_output_url, params: { n: '10', sequence:'2 4 5 7 25 64 81 9 3' }
  #   assert_response :success
  #   assert_not_nil assigns[:error]
  #   assert_nil assigns[:result]
  # end

end
