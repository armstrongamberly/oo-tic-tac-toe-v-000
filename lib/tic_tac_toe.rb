class TicTacToe
    def initialize
      @board = Array.new(9, " ")
    end

    def board=(board)
      @board = board
    end

    def board
      @board
    end

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]]

  def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    board[index] = player
  end

  def position_taken?(index)
    board[index] != " " && board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      player = current_player
    if valid_move?(index) == true
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    board.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
  end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
       "X"
    else "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
           elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combination
     end
     end
    false
   end

   def full?
     if board.any?{|s| s == " " || s == ""}
      false
     else true
     end
   end

  def draw?
    full? == true && won? == false
  end

  def over?
  won? != false || draw? == true
  end

  def winner
     if won? == false
       nil
 else won?.each do |position|
     return board[position]
     end
    end
  end

  def play
    until over?
      turn
  end
   if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
    end
  end
end
