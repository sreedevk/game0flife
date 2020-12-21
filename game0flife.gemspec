Gem::Specification.new do |s|
  s.name          = 'game0flife'
  s.version       = '0.0.1'
  s.licenses      = ['MIT']
  s.summary       = 'Game Of Life on SDL2'
  s.description   = "Conway's Game of Life Implemented in Ruby & Rendered using SDL2"
  s.authors       = ['Sreedev Kodichath']
  s.email         = 'sreedevpadmakumar@gmail.com'
  s.files         = [
    'bin/game0flife',
    'lib/grid.rb',
    'lib/cell.rb',
    'lib/display.rb',
    'lib/seed.rb',
    'lib/seeds/acorn.rb',
    'lib/seeds/diehard.rb',
    'lib/seeds/r_pentomino.rb',
    'lib/seeds/simple_spaceship.rb'
  ]
  s.homepage              = 'https://sree.dev/game0flife'
  s.metadata              = { 'source_code_uri' => "https://github.com/sreedevk/game0flife" }
  s.bindir                = 'bin'
  s.required_ruby_version = '>= 2.7.2'
  s.requirements          = 'libsdl2 | SDL2'
  s.add_runtime_dependency 'ruby-sdl2', '0.3.5'
  s.executables   << 'game0flife'
  spec.post_install_message = <<-POSTMSG

       ██████   █████  ███    ███ ███████  ██████  ███████ ██      ██ ███████ ███████ 
      ██       ██   ██ ████  ████ ██      ██  ████ ██      ██      ██ ██      ██      
      ██   ███ ███████ ██ ████ ██ █████   ██ ██ ██ █████   ██      ██ █████   █████   
      ██    ██ ██   ██ ██  ██  ██ ██      ████  ██ ██      ██      ██ ██      ██      
       ██████  ██   ██ ██      ██ ███████  ██████  ██      ███████ ██ ██      ███████ 

      Usage:
        game0flife [options]

      Options:
        --pattern=<acorn|diehard|r_pentomino|simple_spaceship>
        --framerate=60
        --pattern_x=20    (60x60 Frame)
        --pattern_y=20    (60x60 Frame)

  POSTMSG
end
