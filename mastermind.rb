class MastermindPlayer
  @@POSSIBLE_COLORS = ["green", "yellow", "blue", "orange", "purple", "red"]
  def initialize()
    
  end

  def generate_code()
    code = []
    4.times do
      code.push(@@POSSIBLE_COLORS[rand(6)])
    end
    return code
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
  def initialize()
    @guesses = []
  end

  def get_guess()
    guess = []
    print @@POSSIBLE_COLORS
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
    @code = []
  end
end

turn_counter = 0
human = MastermindHuman.new()
computer = MastermindComputer.new()
code = computer.generate_code()
12.times do
  guess = human.get_guess()
  feedback = computer.get_feedback(code, guess)
  puts feedback
  break if feedback == "you win"
  turn_counter += 0
end
if turn_counter == 13
  puts "you lose"
end