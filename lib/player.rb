class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end


  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end
  
  def get_damage(damage)
    @life_points -= damage
    @life_points <= 0 ? "Le joueur #{@name} a été tué !" : "le joueur #{@name} a #{@life_points} pv !"
    
  end

  def attack(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage()
    puts "le joueur #{player.name} subit #{damage} points de dommages"
    player.get_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
  

end

class HumanPlayer < Player
 
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}."
    if dice > @weapon_level
      @weapon_level = dice
      puts  "tu la prends car elle est meilleure."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    roll = rand(1..6)
    case roll
    when 1
      puts  "Tu n'as rien trouvé... "
    when (2..5)
      (@life_points += 50)> 100 ? @life_points = 100 : @life_points 
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      puts "#{@name} a maintenant #{@life_points} points de vie"
    when 6
      (@life_points += 80)> 100 ? @life_points = 100 : @life_points
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      puts "#{@name} a maintenant #{@life_points} points de vie"
    else
      puts "error"
    end
  end

end