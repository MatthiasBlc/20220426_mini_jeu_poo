
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Introduction
puts " -----------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |" 
puts "|Le but du jeu est d'être le dernier survivant !|"
puts " -----------------------------------------------"

# Player Initiation
puts "Quel est ton nom?"
puts ">"
name = gets.chomp
player1 = HumanPlayer.new(name)

#  Initiation
enemies = []
enemy1 = Player.new("José")
enemies << enemy1
enemy2 = Player.new("Francis")
enemies << enemy2

# Battle 
while player1.life_points > 0 && (enemy1.life_points >0 || enemy2.life_points >0 )
  puts "-"*50
  puts "Voici l'état du joueur :"
  puts player1.show_state
  
  # choice
  puts "-"*50
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\n"
  puts "attaquer un joueur en vue :"
  puts enemy1.life_points >= 0 ? ("0 " + enemy1.show_state) : "#{enemy1.name} est mort"
  puts enemy2.life_points >= 0 ? ("1 " + enemy2.show_state) : "#{enemy2.name} est mort"
  puts "\n"
  puts ">"
  case gets.chomp
  when "a"
    player1.search_weapon
  when "s"
    player1.search_health_pack
  when "0"
    player1.attack(enemy1)
  when "1"
    player1.attack(enemy2)
  else
    puts "Error"
  end

  # riposte
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
  enemy.life_points <= 0 ? next : enemy
  enemy.attack(player1)
  player1.life_points <= 0 ? break : player1
  end
end
puts "-"*50
player1.life_points > 0 ? (puts"BRAVO ! TU AS GAGNE !") : ( puts"Loser ! Tu as perdu !")
