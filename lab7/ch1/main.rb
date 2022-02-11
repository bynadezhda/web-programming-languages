# frozen_string_literal: true

require_relative 'func'

file_name = 'text.txt'
puts 'Enter lines multiples of 5, type "end" to stop.'
File.open(file_name, 'w') do |file|
  while (number = gets) != "end\n"
    file.write(number)
  end
end

func(file_name)