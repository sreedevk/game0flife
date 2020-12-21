# frozen_string_literal: true

# Population
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
      live_ncells == 3 ? ALIVE : DEAD
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
