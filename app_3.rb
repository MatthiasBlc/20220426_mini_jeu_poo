
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Introduction
puts " -----------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |" 
puts "|Le but du jeu est d'être le dernier survivant !|"
puts " -----------------------------------------------"

# Game Initiation
puts "Quel est ton nom?"
puts ">"
name = gets.chomp
my_game = Game.new(name)

#  Initiation

# Battle 
input_state = true
while my_game.is_still_ongoing?
  while input_state == true
    puts my_game.show_players 

    # choice
    puts my_game.menu
    puts ">"
    input = gets.chomp
    input.to_i == 0 ? input = input : input = input.to_i
    puts my_game.menu_choice(input)
    if my_game.menu_choice(input) == "Try another input"
      input_state = true 
      else
      input_state = false
      next
    end
  end
  input_state = true

  # riposte
  my_game.enemies_attack
end

puts my_game.end