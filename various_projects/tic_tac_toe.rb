class TicTacToe
  def initialize()
    puts 'Enter name of player 1'
    @player1 = gets.chomp
    puts 'Enter name of player 2'
    @player2 = gets.chomp
    @board = Array.new(3) {Array.new(3, :e)}
    @winner = -1
    @turn = Random.rand(1..2)
    @counter = 1
  end

  private

  def change_turn
    @turn += 1
    @turn = @turn % 2 if @turn > 2
  end

  def check_winner
    # in case 3 adjacent cells
    @board.any? do |row|
      return @player1 if row.all? {|value| value == :x}
      return @player2 if row.all? {|value| value == :o}
    end

    # in case 3 on top of each other
    0.upto(2) do |index|
      return @player1 if @board.all? {|row| row[index] == :x}
      return @player2 if @board.all? {|row| row[index] == :o}
    end

    # in case 3 across
    if (@board[0][0] == @board[1][1] && @board[1][1]== @board[2][2])
      return @player1 if @board[1][1] == :x
      return @player2 if @board[1][1] == :o
    end

    if (@board[0][2] == @board[1][1] && @board[1][1]== @board[2][0])
      return @player1 if @board[1][1] == :x
      return @player2 if @board[1][1] == :o
    end
    return -1
  end

  def make_move(row, column)
    if @board[row][column] != :e
      invalid_move
      return false
    end
    if @turn == 1
      @board[row][column] = :x
    else
      @board[row][column] = :o
    end
  end

  def display_board
    @board.each do |row|
      row.each_with_index do |cell, index|
        if cell == :o
          print 'O'
        elsif cell == :x
          print 'X'
        else
          print '_'
        end
        if index < 2
          print ' | '
        end
      end
      puts
    end
  end

  public

  def play_game
    puts "New game between #{@player1} and #{@player2}"
    until @winner != -1
      display_board
      puts @turn == 1 ? "#{@player1}, your move!" : "#{@player2}, your move!"
      puts "counter: #{@counter}"
      next_move = gets.chomp.split
      next_move.map! {|value| value.to_i}
      if (next_move.length != 2 || next_move[0] > 2 || next_move[0] < 0 || next_move[1] > 2 || next_move[1] < 0)
        invalid_input
        next
      end
      move = make_move(next_move[0], next_move[1])
      unless move
        next
      end

      @winner = check_winner
      if @winner != -1
        puts "#{@winner} WINS!"
        display_board
      elsif @counter == 9 && @winner = -1
        puts "Its a tie game!"
        exit
      else
        change_turn
        @counter += 1
      end
    end
  end

  private

  def invalid_input
    puts 'Invalid input, please select numbers between 0 and 2 (rows, columns) seperated by a space.'
  end

  def invalid_move
    puts 'Invalid move, please select an empty cell.'
  end
end

new_game = TicTacToe.new()
new_game.play_game