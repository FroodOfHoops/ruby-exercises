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
    if @winner > 0
      puts @@wintext
    else
      puts @@losetext + @answer
    end
  end
end

# game = Game.new
# game.play()

class Game2
  @@introtext = "(insert Mastermind rules here)\n" +
  "Colors are B(lue), G(reen), O(range), P(urple), R(ed), and Y(ellow)\n"
  @@guesses = 10
  @@invite_feedback1 = "How many colours did I get in the right place?"
  @@invite_feedback2 = "How many colours did I get in the wrong place?"
  @@wintext = "Unless one of us has done something wrong, your code is: "
  @@losetext = "I'm out of guesses, but I narrowed it down to "
  @@errortext = "Something's gone wrong, there don't seem to be any valid options left. Oops!"

  def initialize
    self.make_list()
    @played = 0
    @guess = ""
    @current_list = []
    @full_list = []
  end

  def make_list()
    @full_list = []
    for i in 0..5 do
      for j in 0..5 do
        for k in 0..5 do
          for l in 0..5 do
            @full_list.push("#{$colors[i]}" + "#{$colors[j]}" + "#{$colors[k]}" + "#{$colors[l]}")
          end
        end
      end
    end
    @current_list = @full_list
  end

  def cut_list(guess, feedback)
    new_list = []
    @current_list.each do |grid|
      if compare(guess, grid) == feedback
        new_list.push(grid)
      end
    end
    @current_list = new_list
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
    feedback = [whitecount, blackcount]
    return feedback
  end

  def round()
    if @current_list.length < 1
      puts @@errortext
      @played = @@guesses
      return
    end
    if @current_list.length == 1
      @played = @@guesses
      return
    end
    if @guess == ""
      @guess = @current_list.sample
    end
    puts "My guess is: " + @guess.to_s + "\n"
    puts @@invite_feedback1
    feedback1 = gets.chomp
    puts @@invite_feedback2
    feedback2 = gets.chomp
    if ["0", "1", "2", "3", "4"].include?(feedback1) && ["0", "1", "2", "3", "4"].include?(feedback2)
      self.cut_list(@guess, [feedback1.to_i, feedback2.to_i])
      @played += 1
      @guess = ""
    else
      puts "Both responses should be a number from 0 to 4!"
    end
  end

  def play()
    puts @@introtext
    self.make_list()
    while @played < @@guesses
      self.round()
    end
    if @current_list.length == 1
      puts @@wintext + @current_list[0]
    else
      puts @@losetext + @current_list.length.to_s + " possibilities!"
    end
  end

end

game2 = Game2.new
game2.play()
