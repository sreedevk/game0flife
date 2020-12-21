require_relative '../cell.rb'

class SimpleSpaceship
  PATTERN = [
    [Cell::DEAD, Cell::ALIVE, Cell::DEAD],
    [Cell::DEAD, Cell::DEAD, Cell::ALIVE],
    [Cell::ALIVE, Cell::ALIVE, Cell::ALIVE]
  ].freeze
end
