require 'bundler'
Bundler.require

require_relative 'lib/game'
# require_relative 'lib/game_bis'
require_relative 'lib/player'

def quest_ce_quelle_est_chomp
    return gets.chomp
end

print "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
------------------------------------------------->"
puts " "
print "> APPUIE SUR ENTREE"
puts " "
print "> "

gets.chomp

puts "Choisi un nom pour ton joueur"
print "> "
playername = gets.chomp


my_game = Game.new("#{playername}")

while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice(quest_ce_quelle_est_chomp)
    my_game.show_players
    my_game.enemies_attack
    my_game.show_players
end
my_game.end_of_game




