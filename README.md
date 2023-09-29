# mastermind
possible colors: green, yellow, blue, orange, purple, red
randomly select code of 4 colors and put in array
initialize turn counter
take guess as array
give feedback
  check win
  initialize black and white with 0
  how many are correct color in correct position
    create new arrays of incorrect
    increment black for each correct
  how many are correct color in wrong position
    check if color exits in new_guess and new_answer
    increment white for each correct
increment turn counter
another guess and repeat until win or 12 turns