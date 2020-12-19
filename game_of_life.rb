# frozen_string_literal: true

class Cell
  DEAD  = ' '
  ALIVE = '█'
  attr_reader :state, :coordinates

  def initialize(state, *coordinates)
    @coordinates = coordinates
    @state = state
    n_indices
  end

  def n_indices
    @n_indices ||= neighbor_indices
  end

  def dead?
    @state == DEAD
  end

  def alive?
    @state == ALIVE
  end

  def next_gen_fate(live_ncells)
    if @state == ALIVE
      (2..3).cover?(live_ncells) ? ALIVE : DEAD
    elsif @state == DEAD
      (live_ncells == 3) ? ALIVE : DEAD
    end
  end
end

def neighbor_indices
  y_neighbors = [-1, 0, 1].product([@coordinates[1]]).map(&:sum)
  x_neighbors = [-1, 0, 1].product([@coordinates[0]]).map(&:sum)
  neighbors = x_neighbors.product(y_neighbors)
  neighbors -= [@coordinates]
  neighbors.map do |n_coords|
    [n_coords[0] % Grid::ROWS, n_coords[1] % Grid::COLS]
    
  end
end

class Grid
  attr_reader :grid_struct
  ROWS  = 32
  COLS  = 128
  DEAD  = ' '
  ALIVE = '█'
  PBACK_SPEED = 0.1

  def initialize
    @grid_struct = create_grid_struct(true)
  end

  def play
    loop do
      puts "\e[H\e[2J"
      grid_print
      inc_gen
      sleep PBACK_SPEED
    end
  end

  def create_grid_struct(randomize=false)
    ROWS.times.map do |ri|
      COLS.times.map do |ci|
        Cell.new((randomize ? [ALIVE, DEAD].sample : DEAD), ri, ci)
      end
    end
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
          cell.next_gen_fate(
            cn_cells.count(&:alive?)
          ),
          ri,
          ci
        )
      end
    end
    next_gen_grid
  end
end

w = Grid.new
w.play
