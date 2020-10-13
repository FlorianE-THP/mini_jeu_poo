#On crée une classe player
class Player 
    #On leur permet d'être lu et écrit (read and write)
    attr_accessor :name, :life_points
    #Je fais une méthode Initialize avec en paramètre un name. Qui sera celui de mon player plus tard
    def initialize(name)
        @name = name 
        @life_points = 10
    end
    # Méthode pour connaitre les points de vie du joueur ou des bots.
    def show_state
        puts "#{name} a #{life_points} points de vie."
    end
    # Méthode pour infliger des dégats
    def gets_damage(aie)
         @life_points -= aie
         if @life_points <= 0
            puts "Le joueur #{name} a été tuée"
         end
    end
    # Méthode pour attaquer
    def attacks(player)
        puts "Le joueur #{name} attaque #{player.name}"
        damage = compute_damage
        puts "Il lui inflige #{damage} points de dommages."
        player.gets_damage(damage)
        
    end
    # Méthode pour randomizer un nombre qui sera les dommages causés lors d'une attaque
    def compute_damage
        return rand(1..6)
      end
end

# Je crée une classe HumanPlayer qui hérite de Player
class HumanPlayer < Player
    attr_accessor :weapon_level
#Je fais une méthode Initialize avec en paramètre un name. Qui sera celui de mon HumanPlayer plus tard
    def initialize(name)
        super(name)
       @life_points = 100
       @weapon_level = 1  
    end

    def show_state
    puts " "
    puts " "
    print "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end 

    def compute_damage
        rand(1..6) * @weapon_level
    end
#Je fais une méthode search weapon qui va me sortir un nombre random.. et en fonction, permettra d'améliorer l'arme de HumanPlayer
    def search_weapon
        weapon = rand(1..6) 
        
        puts "Tu as trouvé une arme de niveau #{weapon}."
        if weapon > @weapon_level
           @weapon_level = weapon
          puts "Cette arme est meilleure que la tienne, c'est cool, on la garde !"
        else 
          puts "Cette arme est moins bien que la tienne, on change rien."
        
        end
    end
#Je fais une méthode search weapon qui va me sortir un nombre random.. et en fonction, permettra d'augmenter la santé de HumanPlayer
    def search_health_pack 
      pack = rand(1..6)
      case pack 
      when 1
        puts "Tu n'as rien trouvé"
      when 2..5 
        puts "Tu as trouvé un pack de 50 points de vie."
        if @life_points < 50 
            @life_points += 50
        else 
            @life_points = 100
        end
    when 6 
        puts "Tu as trouvé un pack de 80 points de vie."
        if @life_points < 20 
            @life_points += 80
        else 
            @life_points = 100
        end
      end
    end

end