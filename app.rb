
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("José")
player2 = Player.new("Francis")


puts "player1 is #{player1.name}."
puts "player2 is #{player2.name}."
puts "Présentons les deux combattants"

while player1.life_points > 0 && player2.life_points >0
  puts "-"*50
  puts "Voici l'état de chaque joueur :"
  puts player1.show_state
  puts player2.show_state
  puts player1.attack(player2)
  player2.life_points <= 0 ? break : player2
  puts player2.attack(player1)
end

