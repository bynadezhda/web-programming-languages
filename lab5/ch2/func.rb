require './rus.rb'

def func(arr)
  arr.map! do |string|
    words = string.split
    words.map! do |word|
      if word.end_with?("онок")
        word[-4, 4] = "ата"
      elsif word.end_with?("енок")
        word[-4, 4] = "ята"
      end
      word
    end
    words.join(" ")
  end
end

