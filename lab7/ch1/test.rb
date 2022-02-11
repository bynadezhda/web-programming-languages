# frozen_string_literal: true

def file_output(maxes, file_name)
    File.open(file_name, 'w') do |file|
      maxes.each { |x| file.puts(x) }
    end
end
  
def func(file_name)
    numbers = File.read(file_name).split.map(&:to_i)
    raise Error, 'Amount must multiple of 5' unless numbers.size % 5 == 0 
      
    i = 0
    maxes = []
    (numbers.size/5).times do
      part = numbers[i...i+5]
      maxes.push(part.max)
      i += 5
    end
  
    file_name_results = 'result.txt'
    file_output(maxes, file_name_results)
end
