require_relative '../cell.rb'

class RPentomino
  PATTERN = [
    [Cell::DEAD, Cell::ALIVE, Cell::ALIVE],
    [Cell::ALIVE, Cell::ALIVE, Cell::DEAD],
    [Cell::DEAD, Cell::ALIVE, Cell::DEAD]
  ]
end
