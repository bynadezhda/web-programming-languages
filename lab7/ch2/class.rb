# frozen_string_literal: true

class Rectangle
  attr_reader :length, :width
    
  def initialize(length, width)
    raise ArgumentError, 'Argument (length) must be an integer.' unless length.is_a? Integer
    raise ArgumentError, 'Argument (width) must be an integer.' unless width.is_a? Integer
  
    @length = length.to_i
    @width = width.to_i
  end
  
  def square
    @length*@width
  end
  
  def out
    puts @length
    puts @width
  end
end
  
class Parallelepiped < Rectangle
  attr_reader :length, :width, :height
  def initialize(length, width, height)
    super(length, width)
    raise ArgumentError, 'Argument(height) must be an integer.' unless height.is_a? Integer
  
    @height = height
  end
  
  def volume
    square*@height
  end
  
  def length_ret
    @length
  end

  def width_ret
    @width
  end

  def height_ret
    @height
  end

  def out
    puts @length
    puts @width
    puts @height
  end
end
  