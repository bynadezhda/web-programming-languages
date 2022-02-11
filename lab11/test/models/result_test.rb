require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  test 'should set and get values' do
    temp = Result.create(input:"2 4 16 3 4 16 25 64 64 78 9",output:"[[4, 16], [4, 16, 25, 64, 64]]")
    temp1 = Result.find_by(input:"2 4 16 3 4 16 25 64 64 78 9")
    str = temp1.output
    temp1.delete

    assert_equal temp.output, str
  end

  test 'should error on non unique N' do
    assert_equal Result.create(input:"2 4 16 3 4 16 25 64 64 78 9").valid?, true
  end

  test 'should save data into db' do
    assert Result.create(input: "2 4 16 3 4 16 25 64 64 78 7",output: "[[4, 16], [4, 16, 25, 64, 64]]")
  end

  test 'should get data from db' do
    Result.create(input: "2 4 16 3 4 16 25 64 64 78 5",output: "[[4, 16], [4, 16, 25, 64, 64]]")
    temp2 = Result.find_by(input:"2 4 16 3 4 16 25 64 64 78 5").output
    assert_equal temp2,"[[4, 16], [4, 16, 25, 64, 64]]"
  end
end
