$colors = ['B', 'G', 'O', 'P', 'R', 'Y']


class Game
  @@introtext = "(insert Mastermind rules here)\n" +
  "Colors are B(lue), G(reen), O(range), P(urple), R(ed), and Y(ellow)\n"
  @@invite_guess = "Have a guess\n"
  @@guesses = 10
  @@losetext = "Sorry, you lose! The answer was "
  @@wintext = "Congratulation!"

  def initialize
    @answer = self.create_answer()
    @played = 0
    @winner = 0
  end

  def create_answer()
    answer = []
    4.times do
      x = rand(6)
      answer.push($colors[x])
    end
    return answer.join()
  end

  def compare(code1, code2)
    whitecount = 0
    blackcount = 0
    array1 = code1.chars
    array2 = code2.chars
    4.times do |i|
      j = i-1
      whitecount += 1 if code1[j] == code2[j]
    end
    $colors.each do |color|
      blackcount += [array1.count(color), array2.count(color)].min
    end
    blackcount -= whitecount
#    4.times do |i|
#      j = i-1
#      if code1[j] != code2[j] && code2.include?(code1[j])
#        blackcount += 1
#        code2.sub!(code1[j], "")
#      end
#    end
    feedback = [whitecount, blackcount]
    return feedback
  end

  def grade(response)
    "Correctly placed: #{response[0]}\n" +
    "Incorrectly placed: #{response[1]}"
  end

  def checkvalid(guess)
    return 1 if guess.to_s.length != 4 # error 1 wrong length
    for i in 0..3 # error 2 invalid characters
      return 2 unless $colors.include?(guess[i])
    end
    return 3
  end

  def round()
    puts @@invite_guess
    guess = gets.chomp.to_s.upcase
    validguess = checkvalid(guess)
    case validguess
    when 1
      puts "Guess must be exactly four characters!\n"
    when 2
      puts "Guess must be a combination of the six available colours!\n"
    else
      response = compare(guess, @answer)
      @played += 1
      puts grade(response)
      if response == [4,0]
        @winner += 1
      end
    end
  end

  def play
    puts @@introtext
    while @played < @@guesses && @winner == 0
      self.round()
    end
#    @winner > 0 ? puts @@wintext : puts @@losetext + @answer + "\n"
    if @winner > 0
      puts @@wintext
    else
      puts @@losetext + @answer
    end
  end
end

game = Game.new
game.play()