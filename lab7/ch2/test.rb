# frozen_string_literal: true

require_relative 'class'
require 'minitest/autorun'

# Testing class
class TestFunction < Minitest::Test
  def test_rectangle
    length = 2
    width = 3
    obj = Rectangle.new(length,width)
    exp_res = 6

    assert_equal(obj.square, exp_res, 'Test_rectangle Rectangle.square method error. Not equal.')
  end

  def test_parallelepiped
    length = 2
    width = 3
    height = 3
    obj = Parallelepiped.new(length, width, height)
    exp_res = 18

    assert_equal(obj.volume, exp_res, 'Parallelepiped_rectangle Parallelepiped.volume method error. Not equal.')
    assert_equal(obj.length_ret, length, 'Parallelepiped_rectangle Parallelepiped.length_ret method error. Not equal.')
    assert_equal(obj.width_ret, width, 'Parallelepiped_rectangle Parallelepiped.width_ret method error. Not equal.')
    assert_equal(obj.height_ret, height, 'Parallelepiped_rectangle Parallelepiped.height_ret method error. Not equal.')
  end

  def test_rectangle_arg
    length = 'er'
    width = 'w'

    assert_raises(ArgumentError, 'Rectangle_arg_1 exception raise failed') { Rectangle.new(length,width) }
  end

  def test_record_arg
    length = 'e'
    width = 'r'
    height = 'xs'
    
    assert_raises(ArgumentError, 'Record_arg_1 exception raise failed') { Parallelepiped.new(length,width,height) }
  end
end
