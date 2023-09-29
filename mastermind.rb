POSSIBLE_COLORS = ["green", "yellow", "blue", "orange", "purple", "red"]

def generate_code()
  code = []
  4.times do
    code.push(POSSIBLE_COLORS[rand(6)])
  end
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
  return guess
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

turn_counter = 0
code = generate_code()
12.times do
  guess = get_guess()
  feedback = get_feedback(code, guess)
  puts feedback
  break if feedback == "you win"
  turn_counter += 0
end