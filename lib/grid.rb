# frozen_string_literal: true

require_relative 'cell.rb'
require_relative 'display.rb'

# Universe
class Grid
  attr_reader :grid_struct
  ROWS  = 60
  COLS  = 60
  DEAD  = ' '
  ALIVE = '█'
  PBACK_SPEED = 0.000

  def initialize
    @grid_struct = create_grid_struct(true)
  end

  def create_grid_struct(randomize = false)
    ROWS.times.map do |ri|
      COLS.times.map do |ci|
        Cell.new((randomize ? ([ALIVE] + ([DEAD] * 2)).sample : DEAD), ri, ci)
      end
    end
  end

  def map(&block)
    @grid_struct.map(&block)
  end

  def inc_gen
    @grid_struct = next_generation_grid_struct
  end

  def neighbor_cells(*coords)
    current_cell = @grid_struct.dig(*coords)
    current_cell.n_indices.map do |neighbor_cell_coords|
      @grid_struct.dig(*neighbor_cell_coords)
    end
  end

  def grid_print
    print(@grid_struct.map do |row|
      row.map(&:state).join
    end.join("\n"))
    puts
  end

  def next_generation_grid_struct
    next_gen_grid = create_grid_struct
    @grid_struct.map.with_index do |row, ri|
      row.map.with_index do |cell, ci|
        cn_cells = neighbor_cells(ri, ci)
        next_gen_grid[ri][ci] = Cell.new(
          cell.next_gen_fate(cn_cells.count(&:alive?)), ri, ci
        )
      end
    end
    next_gen_grid
  end
end
