def caesar(plain, shift)
  cyph = ""
  p_text = plain.chomp.split("")
  p_text.each_with_index do |x, indx|
    x.ord
    if x.ord >= 65 && x.ord <= 90
      ccord = x.ord + shift
      ccord -= 26 if ccord > 90
    elsif x.ord >= 97 && x.ord <= 122
      ccord = x.ord + shift
      ccord -= 26 if ccord > 122
    else
      ccord = x.ord
    end
    cyph[indx] = ccord.chr
  end
  # cyph.join("")
  cyph
end

puts "Enter string to be encoded:"
plain = gets.chomp.to_s
puts "Enter number to be shifted:"
num = gets.chomp.to_i

while num < 1 || num > 26
  puts "Shift number must be between 1 and 26:"
  num = gets.chomp.to_i
end

cypher = caesar(plain, num)

puts cypher
