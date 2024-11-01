word_list = ["a","test","sample","words","egg","cat","foo","ni"]

def substrings(a_string, dictionary)
  my_array = a_string.downcase.split(" ")
  result = Hash.new(0)
  my_array.each do |x|
    dictionary.each do |y|
      result[y] += 1 if x.include?(y)
    end
  end
  result
end

# i'm sure i could simplify this if i could get my head around #reduce

puts "Enter string:"
my_string = gets.chomp.to_s

puts substrings(my_string, word_list)
