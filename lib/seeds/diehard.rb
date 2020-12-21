require_relative '../cell.rb'

class Diehard
  PATTERN = [
    [Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::DEAD],
    [Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD],
    [Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE],
  ]
end
