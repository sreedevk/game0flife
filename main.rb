# frozen_string_literal: true

require_relative './lib/grid.rb'
require_relative './lib/cell.rb'
require_relative './lib/display.rb'

FRAMERATE = 30

grid = Grid.new
Display.new(grid, FRAMERATE).render
