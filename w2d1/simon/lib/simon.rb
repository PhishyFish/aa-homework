class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts @seq.join(", ")

    sleep(2)
    system("clear")
  end

  def require_sequence
    puts "Simon says: (type colors separated by commas)"
    guess = gets.downcase.chomp.split(", ")

    if guess.count != @sequence_length
      puts "Wrong number of colors; there are #{@sequence_length} in the sequence."
      puts "Did you forget a comma?"

      guess = gets.downcase.chomp.split(", ")
    end

    unless guess == @seq
      puts "Wrong! You entered \"#{guess.join(', ')}\"."
      puts "The correct sequence is \"#{@seq.join(', ')}\"."
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Great memory! Onto the next round."
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Let's play Simon! Repeat the color sequence in the correct order."
  Simon.new.play
end
