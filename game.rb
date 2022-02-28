
def mark_board (turn, choice, board)
  for i in 0..board.length()
    if (i+1) == choice
      if turn == 0
        board[i] = 'x'
        turn = 1
      elsif turn == 1
        board[i] = 'o'
        turn = 0
      end
    end
  end
  return turn
end

def print_board (board)
  for i in 0..board.length()
    print board[i]
    if (i+1) % 3 == 0
      puts
    end
  end
end

def check_victory (board)
  # check horizontal
  if (board[0] == board[1] and board[1] == board[2]) or
     (board[3] == board[4] and board[4] == board[5]) or
     (board[6] == board[7] and board[7] == board[8]) 
        return true
  end

  # check vertical
  if (board[0] == board[3] and board[3] == board[6]) or
     (board[1] == board[4] and board[4] == board[7]) or
     (board[2] == board[5] and board[5] == board[8]) 
        return true
  end

  # check diagonal
  if (board[0] == board[4] and board[4] == board[8]) or
     (board[2] == board[4] and board[4] == board[6])
        return true
  end

  return false
end

def board_full(board)
  for i in 0..board.length()
    if board[i].is_a? Numeric
      return false
    end
  end
  return true
end

board = [
  1,2,3,
  4,5,6,
  7,8,9
]

turn = 0

# main
while 1
  print_board(board)
  # check board fill

  if board_full(board)
    puts "Board full! the end"
    return
  end

  if check_victory(board)
    puts "victory!"
    return
  end

  choice = gets.chomp.to_i

  while !(choice.is_a? Numeric) or !(board[choice-1].is_a? Numeric) or choice < 0 or choice > 9
    puts 'Invalid choice'
    print_board(board)
    choice = gets.chomp.to_i
  end
  turn = mark_board(turn, choice, board)
end


