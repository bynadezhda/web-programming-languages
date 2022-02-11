require './func'
require './rus'


puts "Enter strings, enter \"end\" to finish"
text = []
while (v = gets) != "end\n"
  text << v
end

func(text)
print text