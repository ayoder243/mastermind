POSSIBLE_COLORS = ["green", "yellow", "blue", "orange", "purple", "red"]

class MastermindPlayer
  def initialize()
    @guesses = []
  end

  def get_feedback(code, guess)
    feedback = {
      black: 0,
      white: 0,
    }
  
    if guess == code
      return "you win"  
    else
      new_code = []
      new_guess = []
      for i in (0..3)
        if code[i] == guess[i]
          feedback[:black] += 1
        else
          new_code.push(code[i])
          new_guess.push(guess[i])
        end
      end
      for i in new_code
        if new_guess.include?(i)
          feedback[:white] += 1
          new_guess.delete_at(new_guess.index(i))
        end
      end
      return feedback
    end
  end
end

class MastermindHuman < MastermindPlayer
  def generate_code()
    code = []
    print POSSIBLE_COLORS
    puts
    print "Position 1: "
    code.push(gets.chomp())
    print "Position 2: "
    code.push(gets.chomp())
    print "Position 3: "
    code.push(gets.chomp())
    print "Position 4: "
    code.push(gets.chomp())
    return code
  end
  
  def get_guess()
    guess = []
    print POSSIBLE_COLORS
    puts
    print "Position 1: "
    guess.push(gets.chomp())
    print "Position 2: "
    guess.push(gets.chomp())
    print "Position 3: "
    guess.push(gets.chomp())
    print "Position 4: "
    guess.push(gets.chomp())
    @guesses.push(guess)
    return guess
  end
end

class MastermindComputer < MastermindPlayer
  def initialize()
    @possible_codes = []
    for one in POSSIBLE_COLORS
      for two in POSSIBLE_COLORS
        for three in POSSIBLE_COLORS
          for four in POSSIBLE_COLORS
            possible_code = []
            possible_code.push([one, two, three, four])
            @possible_codes.push(possible_code)
          end
        end
      end
    end
  end
  
  def generate_code()
    code = []
    4.times do
      code.push(POSSIBLE_COLORS[rand(6)])
    end
    return code
  end
  
  def get_guess(turn_counter, colors_in_code)
    guess = []
    if turn_counter == 0
      return ["green", "green", "green", "green"]
    elsif turn_counter < 6 && colors_in_code.length < 4
      for i in colors_in_code
        guess.push(i)
      end
      (4 - colors_in_code.length).times do
        guess.push(POSSIBLE_COLORS[turn_counter])
      end
      return guess
    else
      return colors_in_code.shuffle
    end
  end

  def remove_codes_with_color(color)
    for i in @possible_codes
      if i.include?(color)
        @possible_codes.delete(i)
      end
    end
  end

  def remove_color_times(color, times)
    for i in @possible_codes
      unless i.count(color) == times
        @possible_codes.delete(i)
      end
    end
  end

  def remove_codes_black(color, position)
    for i in @possible_codes
      unless i[position - 1] == color
        @possible_codes.delete(i)
      end
    end
  end
end

def human_guesser()
  turn_counter = 0
  human = MastermindHuman.new()
  computer = MastermindComputer.new()
  code = computer.generate_code()
  12.times do
    guess = human.get_guess()
    feedback = computer.get_feedback(code, guess)
    puts feedback
    break if feedback == "you win"
    turn_counter += 1
  end
  if turn_counter == 12
    puts "you lose"
  end
end

def computer_guesser()
  turn_counter = 0
  human = MastermindHuman.new()
  computer = MastermindComputer.new()
  code = human.generate_code()
  found_pegs = 0
  colors_in_code = []
  12.times do
    guess = computer.get_guess(turn_counter, colors_in_code)
    feedback = human.get_feedback(code, guess)
    new_pegs = 0
    puts "Turn Number: #{turn_counter + 1}"
    puts "Guess: #{guess}"
    puts "Feedback: #{feedback}"
    break if feedback == "you win"
    new_pegs = (feedback[:white] + feedback[:black]) - found_pegs
    found_pegs = feedback[:white] + feedback[:black]
    if found_pegs == 4
      if new_pegs > 0
        new_pegs.times do
          colors_in_code.push(POSSIBLE_COLORS[turn_counter])
        end
      end
    else
      if new_pegs == 0
        computer.remove_codes_with_color(POSSIBLE_COLORS[turn_counter])
      else
        new_pegs.times do
          colors_in_code.push(POSSIBLE_COLORS[turn_counter])
        end
      end
    end
    turn_counter += 1
  end
  if turn_counter == 13
    puts "you lose"
  end
end

#human_guesser()
computer_guesser()