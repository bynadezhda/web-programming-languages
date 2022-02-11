require_relative 'func'
require 'minitest/autorun'

class TestFunction < Minitest::Test
  def test_1
    x = 10
    z = 15
    res = func(x, z)

    assert_in_delta(-7.5968565, res, 1e-6, 'Not equal. Test 1 failed.')
  end

  def test_2
    x = -3
    z = 0
    res = func(x, z)

    assert_in_delta(-6.0, res, 1e-2, 'Not equal. Test 2 failed.')
  end

  def test_zero_x
    x = 0
    z = 1
    res = func(x, z)

    assert_equal(0.0, res, 'Not equal. Test 3 failed.')
  end
end