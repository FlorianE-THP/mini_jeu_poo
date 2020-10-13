require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

print "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
------------------------------------------------->"
puts " "
print ">APPUIE SUR ENTREE"

gets.chomp 

puts "Choisi un nom pour ton joueur"

playername = gets.chomp

human = HumanPlayer.new("#{playername}")

@array_player = Array.new
@array_player << enemy1 = Player.new("Josianne")
@array_player << enemy2 = Player.new("José")

while human.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
puts " "
human.show_state
puts " "
puts "-------------------"
puts "Quelle action veux-tu effectuer ?"
puts " "
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts " "
puts "Attaquer un joueur en vue :"
if enemy1.life_points > 0
puts "0 - #{enemy1.name} a #{enemy1.life_points} points de vie"
end
if enemy2.life_points > 0
puts "1 - #{enemy2.name} a #{enemy2.life_points} points de vie"
end
puts "-------------------"
case gets.chomp
when "a"
    human.search_weapon
when "s"
    human.search_health_pack
when "0"
    human.attacks(enemy1)
when "1"
    human.attacks(enemy2)
end

if enemy1.life_points > 0 || enemy2.life_points > 0
puts "-------------------"
puts "Les énnemis riposent.."
puts " "
end 

if enemy1.life_points > 0 
    enemy1.attacks(human)
end 

if enemy2.life_points > 0
    enemy2.attacks(human)
end

if enemy1.life_points < 0 && enemy2.life_points < 0
    puts " "
    puts "BRAVO TU VIENS DE GAGNER LA PARTIE"
    puts " "
end 

end