class TicTacToe
  
  Player = Struct.new(:name, :symbol)
  
  def spots
    @spots = [1,2,3,4,5,6,7,8,9]
  end
  
  def board 
    @board = [" ", " ", " ", " ", " ", " ", " ", " " , " "]
  end
  
  def initial_board
    puts " "
    puts "Please type a number to select a position on the board: "
    puts " "
    puts " #{@spots[0]} | #{@spots[1]} | #{@spots[2]}"
    puts "---+---+---"
    puts " #{@spots[3]} | #{@spots[4]} | #{@spots[5]}"
    puts "---+---+---"
    puts " #{@spots[6]} | #{@spots[7]} | #{@spots[8]}"
    puts " "
  end
  
  def draw_board
    puts " "
    puts "The current board looks like this: "
    puts " "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts " "
  end
  
  def player_set
    print "Hello, please type the name of the first player: "
    player1_name = gets.chomp.downcase.capitalize
    print "Thank you, and what is the name of the second player?: "
    player2_name = gets.chomp.downcase.capitalize
    @player1 = Player.new(player1_name, "X")
    @player2 = Player.new(player2_name, "O")
    puts "Ok #{@player1.name} will be #{@player1.symbol}'s"
    puts "and #{@player2.name} will be #{@player2.symbol}'s"
    puts " "
  end
  
  def move
    @moves = 1
    while @moves < 10
      if @moves.even?
        player_up = @player2
      else
        player_up = @player1
      end
      initial_board
      draw_board
      print "#{player_up.name} please select a move: "
      position = gets.chomp.to_i
      verify(position, player_up)
      check_win
      check_tie
    end
  end
  
  def verify(move, player)
    if @board[move-1] != "X" && @board[move-1] != "O"
      @board[move-1] = player.symbol
      @moves += 1
    else 
      puts " "
      puts "Sorry that spot has already been played, please reselect a move."
      move
    end
  end
  
  def check_win
    case
    when @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != " "
      win(@board[0])
    when @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != " "
      win(@board[3])
    when @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != " "
      win(@board[6])
    when @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != " "
      win(@board[0])
    when @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " "
      win(@board[1])
    when @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " "
      win(@board[2])
    when @board[0] == @board[4] && @board[4] == @board[8] && @board[0] != " "
      win(@board[0])
    when @board[2] == @board[4] && @board[4] == @board[6] && @board[2] != " "
      win(@board[2])
    else
      false
    end
  end
  
  def win(won)
    puts " "
    puts "#{won}'s have won"
    draw_board
    play_again?
  end
  
  def check_tie
    if @moves == 10
      puts " "
      puts "looks like we have a tie!"
      puts " "
      play_again?
    end
  end
  
  def play_again?
    puts "Would you like to play again( Y / N)?"
    answer = gets.chomp.downcase
    if answer == "y"
      play
    elsif answer == "n"
      abort
    else 
      puts "Sorry I didn't understand"
      play_again?
    end
  end
   
  def play
    board
    spots
    player_set
    move
  end
end

game1 = TicTacToe.new.play