require_relative '../cell.rb'

class Acorn
  PATTERN = [
    [Cell::DEAD, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD, Cell::DEAD],
    [Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE],
    [Cell::ALIVE, Cell::ALIVE, Cell::DEAD, Cell::DEAD, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE, Cell::ALIVE]
  ]
end
