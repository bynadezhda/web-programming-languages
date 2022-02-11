require_relative 'func'

puts 'Enter function argument f(x, z): '
val_x = gets.to_f
val_z = gets.to_f

result = func(val_x, val_z)
puts "f(x: #{val_x}, z: #{val_z}) = #{result}"
