class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |_cup, idx|
      idx == 6 || idx == 13 ? [] : Array.new(4, :stone)
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 13)
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13

      case idx
      when 6
        @cups[6] << stones.pop if current_player_name == @name1
      when 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[idx] << stones.pop
      end
    end

    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups.take(6).all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    bank1 = @cups[6].size
    bank2 = @cups[13].size

    case bank1 <=> bank2
    when 0
      :draw
    when -1
      @name2
    when 1
      @name1
    end
  end
end
