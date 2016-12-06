## game logic / gameplay goes here

require './game.rb'
require './player.rb'
require './question.rb'
# require 'pry'

new_game = MathGame::Game.new
new_game.start

# binding.pry