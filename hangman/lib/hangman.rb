class Hangman
  def initialize()
    puts '-----------------------------------------------------------------------------'
    puts "Welcome to Hangman! You have 8 incorrect guesses to find the word correctly."
    puts 'Enter player name: '
    @player = gets.chomp
    @word = random_word
    @available_letters = ('a'..'z').to_a
    @incorrect_guesses = 0
    @guess_limit = 8
    @previous_guesses = []
    @len = @word.length
    @solved = '_ ' * @word.length
    puts "#{@solved} (#{@len} letters)"
    turn_sequence
  end

  #selects a random word between 5 and 12 letters long from the 5desk.txt file (returns array)
  def random_word
    contents = File.open('../5desk.txt', 'r', &:read)
    contents_arr = contents.split(/\r\n/)
    contents_arr.delete_if {|word| word.length < 5 || word.length > 12}
    contents_arr[rand(contents_arr.length)].downcase.split("")
  end

  # obtain the player guess and check validity
  def player_guess
    @guess = []
    puts "---------------------------------"
    print "Enter your guess: "
    @guess = gets.chomp.downcase
    if @available_letters.include?(@guess) && !@previous_guesses.include?(@guess) && !@guess.empty? && @guess.length == 1
      return @guess
    end
  end

  def feedback
    if @word.include?(@guess) && !@previous_guesses.include?(@guess)
      puts "\nGood Guess!"
      insert_previous
    elsif !@available_letters.include?(@guess)
      puts "\nInvalid Input, please enter a letter from a to z"
    elsif @previous_guesses.include?(@guess)
      puts "\nYou already guessed the letter #{@guess}"
    else
      puts "\nWrong Guess!"
      insert_previous
      @incorrect_guesses += 1
    end
  end

  # insert the current guess into the previous_guesses array if not there already
  def insert_previous
    unless @previous_guesses.include?(@guess)
      @previous_guesses.push(@guess)
    end
  end

  # displays which were the previous guesses by the player
  def previous_picks
    puts "Previous guesses were: #{@previous_guesses}"
  end

  # displays how many wrong guesses the player has
  def show_guess_left
    puts "\nIncorrect guesses left: #{@guess_limit - @incorrect_guesses} "
  end

  # updates the solved array to display what letters were guessed correctly
  def update_solved
    @word.each_with_index do |v, i|
      @solved[i * 2] = v if v == @guess
    end
    puts @solved
  end

  # checks if player ran out of guesses or if the word match the secret word
  def win_condition
    if @incorrect_guesses == @guess_limit
      puts "#{@player} ran out of guesses. Game over, you're toast bud."
      puts "The word was: #{@word.join}"
      exit
    end
    if @word.join.delete(' ') == @solved.delete(' ')
      puts "Congratulations to #{@player}, the word was indeed #{@word.join}"
      exit
    end
  end

  # sequence of each turn
  def turn_sequence
    while @incorrect_guesses < @guess_limit
      player_guess
      feedback
      previous_picks
      update_solved
      show_guess_left
      win_condition
    end
    @previous_guesses.clear
  end
end

Hangman.new
