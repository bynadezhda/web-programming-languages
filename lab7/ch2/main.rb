# frozen_string_literal: true

require_relative 'class'

puts 'Enter a length, width to create Rectangle-class object'
length = gets.to_i
width = gets.to_i

rectangle = Rectangle.new(length, width)
puts "Object output through \"puts\": #{length}, #{width}"
puts 'Object output through method: '
rectangle.out
puts "Rectangle square method: #{rectangle.square}"

puts 'Enter a length, width, height to create Parallelepiped-class object'
length = gets.to_i
width = gets.to_i
height = gets.to_i

parallelepiped = Parallelepiped.new(length, width, height)
puts "Object output through \"puts\": #{length}, #{width}, #{height}"
puts 'Object output through method: '
parallelepiped.out
puts "Parallelepiped volume method: #{parallelepiped.volume}"
puts "Getter methods: #{parallelepiped.length_ret}, #{parallelepiped.width_ret}, #{parallelepiped.height_ret}"


