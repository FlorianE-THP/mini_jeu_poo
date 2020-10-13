require 'time'
require 'bundler'
Bundler.require


require_relative 'player'

class Game 
    attr_accessor :human_player, :enemies_in_sight, :players_left

    def initialize(name) 
        @human_player = HumanPlayer.new(name) 
        player1 = Player.new("Josiane")
        player2 = Player.new("José")
        player3 = Player.new("Marcel")
        player4 = Player.new("Michel")
        @enemies_in_sight = []
        @players_left = 10
    end

    def kill_player(player) 
        @enemies_in_sight.delete(player)
        @enemies_in_sight
    end

    def is_still_ongoing?
       if @enemies_in_sight == nil || @human_player.life_points <= 0
        return false
       else 
        return true
       end

        # if @human_player.life_points > 0 && !@enemies_in_sight.empty? 
	    # 	return true
	    # else
	    #     return false
	    # end 
    end

    def new_players_in_sight
        if @enemies_in_sight == @players_left
            puts "Tout les ennemis sont en vues"
        else 
            dice = rand(1..6)
            case dice 
            when 1
                puts "---------------"
                puts "Aucun nouveau joueur"
                puts "---------------"
            when 2..4
                number = rand(1..999)
                new_player = "player_#{number}"
                 @enemies_in_sight << new_player = Player.new("Josiane_#{number}")
                 puts "---------------"
                 puts "Un nouveau joueur vient d'arriver !!"
                 puts "---------------"
            when 5..6
                2.times do 
                    number = rand(1..999)
                    new_player = "player_#{number}"
                     @enemies_in_sight << new_player = Player.new("Josiane_#{number}")
                     
                end
                puts "Deux nouveaux joueurs vient d'arriver !!"
            end
        end
    end 

    def show_players 
        @human_player.show_state 
        puts " "
        puts " "
        @enemies_in_sight.each do |enemy|
            if enemy.life_points > 0
                enemy.show_state
            end
        end
    end

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
        @enemies_in_sight.each do |ennemy|
          if ennemy.life_points > 0
            puts "  Met #{i} si tu souhaite attaquer #{ennemy.name} avec #{ennemy.life_points} points de vie "
            i += 1
          end
        end 
    end
    
    def menu_choice(choice)
    case choice
    when "a"
        @human_player.search_weapon
    when "s"
        @human_player.search_health_pack
    else
        @human_player.attacks(@enemies_in_sight[choice.to_i])
		  if @enemies_in_sight[choice.to_i].life_points < 1
            kill_player(@enemies_in_sight[choice.to_i])
    end
    end
    end

    def enemies_attack
        puts "Les romains attaquent !!!"
        @enemies_in_sight.each {|ennemy| ennemy.attacks(@human_player)}
    end

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