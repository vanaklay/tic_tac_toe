require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/player'
require 'app/game'
require 'app/case'
require 'view/boardgame'


def perform
  exit = ""
  while exit != "exit"
    my_game = Game.new
    array_of_users = my_game.board.get_players_name
    user1 = Player.new(array_of_users[0], "X")
    puts
    user2 = Player.new(array_of_users[1], "O")
    puts
    stop = true
    winner = ""
    turn = 9
    my_game.board.get_board_game

    while stop && turn > 0 
      user1_choice = my_game.player_choice(user1) 
      my_game.take_position(user1_choice, user1.marker)
      sleep 1
      system "clear"
      my_game.board.get_board_game
      turn -= 1
      break if turn == 0
      if my_game.board.check_win?(user1.marker)
        winner = user1.name
        stop = false
        break
      end
      user2_choice = my_game.player_choice(user2)
      my_game.take_position(user2_choice, user2.marker)
      sleep 1
      system "clear"
      my_game.board.get_board_game
      turn -= 1
      break if turn == 0
      if my_game.board.check_win?(user2.marker)
        winner = user2.name
        stop = false
        break
      end
    end

    sleep 1
    if turn == 0
      puts "Vous avez fait match nul"
    else
      puts "Le gagnant est #{winner.capitalize}"
    end
    
    puts "Appuyer sur n'importe quelle touche pour recommencer une partie"
    puts "Pour quitter, entrez : 'exit'"
    print "> "
    exit = gets.chomp
  end
  
  sleep 1
  puts "Merci d'avoir joué "
end

perform


