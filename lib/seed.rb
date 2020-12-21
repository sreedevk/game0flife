require_relative 'grid.rb'
require_relative 'cell.rb'

class Seed
  def self.render_to_grid(grid, pattern_name, x, y)
    require_relative("./seeds/#{pattern_name}.rb")
    pattern = eval("#{pattern_name.to_s.split('_').map(&:capitalize).join}::PATTERN")
    pattern.map.with_index do |pattern_row, pri|
      pattern_row.map.with_index do |pattern_col, pci|
        grid[y+pci][x+pri] = Cell.new(pattern_col, x+pri, y+pci)
      end
    end
    return grid
  end
end
