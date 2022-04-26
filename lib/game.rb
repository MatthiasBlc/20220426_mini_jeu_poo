class Game

  attr_accessor :human_player, :enemies

  def initialize(human_player)
    @human_player = HumanPlayer.new(human_player)
    @enemies = []
    enemy1 = Player.new("José")
    @enemies << enemy1
    enemy2 = Player.new("Francis")
    @enemies << enemy2
    enemy3 = Player.new("Micheline")
    @enemies << enemy3
    enemy4 = Player.new("Francine")
    @enemies << enemy4
  end

  def kill_enemy(enemy)
    @enemies.delete(enemy)
  end
  
  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies.any?
  end

  def show_players
    puts "-"*50
    puts "Voici l'état du joueur :"
    puts @human_player.show_state
    puts "\n"
    puts "Il reste #{@enemies.length} adversaires."
  end

  def menu
    puts "-"*50
    puts "Quelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\n"
    puts "attaquer un joueur en vue :"
    
    @enemies.each_with_index do |enemy, i|
      enemy.life_points >= 0 ? (puts "#{i.to_i+1} #{enemy.show_state}") : next
    end
    puts "\n"
  end
  
  def menu_choice(input)
    case input
    when "a"
      @human_player.search_weapon
      
    when "s"
      @human_player.search_health_pack
    when (1..(@enemies.length))
      @human_player.attack(@enemies[input-1])
      @enemies[input-1].life_points <= 0 ? kill_enemy(@enemies[input-1]) : nil
     else
      return "Try another input"
    end
  end
  
  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies.each do |enemy|
      enemy.attack(@human_player)
    end
  end
  
  def end
    puts "-"*50
    @human_player.life_points > 0 ? (puts"BRAVO ! TU AS GAGNE !") : ( puts"Loser ! Tu as perdu !")

  end
  

end