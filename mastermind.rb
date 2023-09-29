possible_colors = ["green", "yellow", "blue", "orange", "purple", "red"]
code = []
4.times do
  code.push(possible_colors[1 + rand(6)])
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

puts code, guess