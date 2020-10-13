require 'time'
require 'bundler'
Bundler.require

#Je fais référance à ma classe Player
require_relative 'player'
#Je crée ma classe Game
class Game 
    attr_accessor :human_player, :enemies
    #je l'itinialise
    def initialize(name) 
        @human_player = HumanPlayer.new(name) 
        player1 = Player.new("Josiane")
        player2 = Player.new("José")
        player3 = Player.new("Marcel")
        player4 = Player.new("Michel")
        @enemies = [player1, player2, player3, player4]
    end
    #Méthode pour supprimer un joueur quand il est mort
    def kill_player(player) 
        @enemies.delete(player)
        @enemies
    end
    #Méthode pour savoir si la partie doit continuer ou non?
    def is_still_ongoing?
        if @human_player.life_points > 0 &&  !@enemies.empty? 
	    	return true
	    else
	      return false
	    end 
    end
    #Un point santé pour le joueur
    def show_players 
        @human_player.show_state 
        puts " "
        puts " "
        @enemies.each do |enemy|
            if enemy.life_points > 0
                enemy.show_state
            end
        end
    end
    #Je crée mon menu
    def menu 
        show_players
        puts " "
        puts "-------------------"
        puts "Quelle action veux-tu effectuer ?"
        puts " "
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts " "
        puts "Si tu souhaites plutôt attaquer un joueur :"
        puts " "
        i = 0
        @enemies.each do |ennemy|
          if ennemy.life_points > 0
            puts "  Met #{i} si tu souhaite attaquer #{ennemy.name} avec #{ennemy.life_points} points de vie "
            i += 1
          end
        end 
    end
    #Je crée mon interface utilisateur avec lequel le joueur va interragir
    def menu_choice(choice)
    case choice
    when "a"
        @human_player.search_weapon
    when "s"
        @human_player.search_health_pack
    else
        @human_player.attacks(@enemies[choice.to_i])
		  if @enemies[choice.to_i].life_points < 1
            kill_player(@enemies[choice.to_i])
    end
    end
    end
    #Méthode pour que les ennemis attaquent chacun leur tour le joueur
    def enemies_attack
        puts "Les romains attaquent !!!"
        @enemies.each {|ennemy| ennemy.attacks(@human_player)}
    end
    #Méthode pour signalé que le jeu est fini.. As-tu gagné ou pas?
    def end_of_game 
    puts " "
    puts "Le combat est terminé"
    if @human_player.life_points > 0
    puts "Bravo soldat ! Tu as gagné !"
    else 
    puts "Bon.. ben t'es nul"
    end
    end

end