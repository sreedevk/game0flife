# frozen_string_literal: true

require 'sdl2'
require_relative 'grid.rb'
require_relative 'cell.rb'

# Graphics Display
class Display
  BLACK  = '000'
  WHITE  = 'FFF'

  DSTD_HEIGHT = 600
  DSTD_WIDTH  = 600

  attr_accessor :renderer, :window, :event_function, :framerate

  def initialize(grid, framerate=60)
    SDL2.init(SDL2::INIT_VIDEO | SDL2::INIT_TIMER | SDL2::INIT_EVENTS)
    @window      = create_window
    @renderer    = window.create_renderer(-1, 0)
    @framerate   = framerate

    @grid        = grid
    @grid_height = Grid::ROWS
    @grid_width  = Grid::COLS

    @cell_width  = DSTD_WIDTH / Grid::COLS
    @cell_height = DSTD_HEIGHT / Grid::ROWS
  end

  def render
    loop do
      event_handler

      clear_screen
      plot_grid
      update_grid

      @renderer.present
      sleep 1.0 / @framerate
    end
  end

  def event_handler
    while ev = SDL2::Event.poll
      if SDL2::Event::KeyDown === ev && ev.scancode == SDL2::Key::Scan::ESCAPE
        exit
      end
    end
  end

  def plot_grid
    @grid.map do |row|
      row.map do |cell|
        plot_cell(cell)
      end
    end
  end

  def update_grid
    @grid.inc_gen
  end

  def plot_cell(cell)
    @renderer.draw_color = decode_color(cell.state == Cell::ALIVE ? WHITE : BLACK)
    @renderer.fill_rect(
      SDL2::Rect.new(
        cell.coordinates[0] * @cell_height,
        cell.coordinates[1] * @cell_width,
        @cell_height, @cell_width
      )
    )
  end

  def self.render_grid(grid)
    new(grid).render
  end

  private

  def clear_screen
    @renderer.draw_color = decode_color(BLACK)
    @renderer.clear
  end

  def decode_color(hex_string)
    hex_string.chars.map do |color_code|
      (color_code.to_i(16) / 15) * 255
    end
  end

  def create_window
    SDL2::Window.create(
      "Conway's Game of Life",
      SDL2::Window::POS_CENTERED,
      SDL2::Window::POS_CENTERED,
      DSTD_WIDTH, DSTD_HEIGHT,
      0
    )
  end
end
