# frozen_string_literal: true

require_relative './lib/grid.rb'
require_relative './lib/cell.rb'
require_relative './lib/display.rb'

# Available Seeds: r_pentomino, :diehard, :acorn, :simple_spaceship
# options
# --framerate=40
# --pattern=simple_spaceship
# --pattern_x=20
# --pattern_y=20

# main application class
class GameOfLife
  DEF_FRAMERATE = 40
  DEF_PATTERN_X = 20
  DEF_PATTERN_Y = 20

  def initialize
    @grid      = Grid.new
    @framerate = parse_arg('framerate') || DEF_FRAMERATE
    @pattern   = parse_arg('pattern')
    prep_grid_for_pattern_render if @pattern
  end

  def prep_grid_for_pattern_render
    @grid.reset
    @grid.load_pattern(
      @pattern.to_sym,
      parse_arg('pattern_x') || DEF_PATTERN_X,
      parse_arg('pattern_y') || DEF_PATTERN_Y
    )
  end

  def run
    Display.new(@grid, @framerate.to_i).render
  end

  def self.run
    new.run
  end

  private

  def parse_arg(arg_type)
    ARGV.map  { |arg| arg.split('0') }
        .find { |arg| arg[0] == arg_type }
        .to_a[1]
  end
end

GameOfLife.run
