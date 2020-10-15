class BoardGame
  attr_accessor :positions

  def create_board(line)
    array_of_positions = []
    3.times do |i|
      array_of_positions << Case.new(line+(i+1).to_s)
    end
    return array_of_positions
  end
  
  def initialize
    table = []
    ["A", "B", "C"].each do |letter|
      table << create_board(letter)
    end
    @positions = table
  end

  def all_keys_of_positions
    return @positions.flatten.map { |case_name| case_name.case_name.keys[0] }
  end

  def get_board_game
    puts "Voici le plateau"
    puts "----------------------"
    puts "   |  1     2     3  |"
    puts " A | #{@positions.flatten[0].case_name.values[0]} " + "|" + " #{@positions.flatten[1].case_name.values[0]} " + "|" + " #{@positions.flatten[2].case_name.values[0]} " + "|"
    puts " B | #{@positions.flatten[3].case_name.values[0]} " + "|" + " #{@positions.flatten[4].case_name.values[0]} " + "|" + " #{@positions.flatten[5].case_name.values[0]} " + "|"
    puts " C | #{@positions.flatten[6].case_name.values[0]} " + "|" + " #{@positions.flatten[7].case_name.values[0]} " + "|" + " #{@positions.flatten[8].case_name.values[0]} " + "|"
    puts "----------------------"
  end
  
  def get_players_name
    puts "Salut les gars ! Prêt pour une partie de Morpion ?"
    sleep 1
    puts "Joueur 1, quel est ton blase ?"
    print "> "
    user1 = gets.chomp
    puts "Bienvenue #{user1}"
    sleep 1
    puts "Joueur 2, quel est ton blase ?"
    print "> "
    user2 = gets.chomp
    puts "Bienvenue #{user2}"
    sleep 1
    return [user1, user2]
  end

  def check_win?(player_marker)
    if positions.flatten[0].case_name.values[0] == " #{player_marker} "  && positions.flatten[1].case_name.values[0] == " #{player_marker} " && positions.flatten[2].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[0].case_name.values[0] == " #{player_marker} "  && positions.flatten[4].case_name.values[0] == " #{player_marker} " && positions.flatten[8].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[0].case_name.values[0] == " #{player_marker} "  && positions.flatten[3].case_name.values[0] == " #{player_marker} " && positions.flatten[6].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[1].case_name.values[0] == " #{player_marker} "  && positions.flatten[4].case_name.values[0] == " #{player_marker} " && positions.flatten[7].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[2].case_name.values[0] == " #{player_marker} "  && positions.flatten[5].case_name.values[0] == " #{player_marker} " && positions.flatten[8].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[2].case_name.values[0] == " #{player_marker} "  && positions.flatten[4].case_name.values[0] == " #{player_marker} " && positions.flatten[6].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[3].case_name.values[0] == " #{player_marker} "  && positions.flatten[4].case_name.values[0] == " #{player_marker} " && positions.flatten[5].case_name.values[0] == " #{player_marker} "
      return true
    elsif positions.flatten[6].case_name.values[0] == " #{player_marker} "  && positions.flatten[7].case_name.values[0] == " #{player_marker} " && positions.flatten[8].case_name.values[0] == " #{player_marker} "
      return true
    else 
      return false
    end
  end

end