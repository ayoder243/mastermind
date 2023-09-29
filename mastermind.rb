possible_colors = ["green", "yellow", "blue", "orange", "purple", "red"]
code = []
4.times do
  code.push(possible_colors[rand(6)])
end
turn_counter = 0
guess = []
puts "green, yellow, blue, orange, purple, red"
print "Position 1: "
guess.push(gets.chomp())
print "Position 2: "
guess.push(gets.chomp())
print "Position 3: "
guess.push(gets.chomp())
print "Position 4: "
guess.push(gets.chomp())


black = 0
white = 0

if guess == code
  puts "you win"  
else
  new_code = []
  new_guess = []
  for i in (0..3)
    if code[i] == guess[i]
      black += 1
    else
      new_code.push(code[i])
      new_guess.push(guess[i])
    end
  end
  for i in new_code
    if new_guess.include?(i)
      white += 1
      new_guess.delete_at(new_guess.index(i))
    end
  end
  print new_code, new_guess
end
print code
print guess

puts black, white