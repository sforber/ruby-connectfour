require_relative "game.rb"

STDOUT.sync = true

game = Game.new
game.places[0][0], game.places[1][0], game.places[2][0], game.places[3][0], game.places[4][0], game.places[5][0], game.places[6][0] = 'X', 'X', 'X', 'X', 'X', 'X', 'X'
game.mainLoop