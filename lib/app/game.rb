class Game
  attr_accessor :board

  def initialize
    @board = BoardGame.new
  end

  def player_choice(player)
    puts "#{player.name.capitalize}, choisis une position"
    print "> "
    user_choice = gets.chomp.capitalize
    puts "#{player.name.capitalize}, tu as choisis #{user_choice}"
    return user_choice
  end

  def take_position(choice, player_marker)
    if @board.positions.flatten.map{|el| el.case_name.keys[0]}.include?(choice)
      @board.positions.map {|arr| arr.map { |x| x.replace_value(choice,player_marker) if x.is_position_empty?(choice)}}
    else 
      puts "Je ne reconnais pas ton emplacement"
      puts "A1, A2, ... , C2, C3"
      print "> "
      choice = gets.chomp.capitalize
      take_position(choice, player_marker)
    end
  end
end