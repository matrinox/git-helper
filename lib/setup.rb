require 'highline'

cli = HighLine.new
# require 'highline/import'

standard = HighLine::ColorScheme.new do |cs|
  cs[:choice] = [:green, :on_black]
  # cs[:horizontal_line] = [:bold, :white, :on_blue]
  # cs[:even_row] = [:green]
  # cs[:odd_row] = [:magenta]
end

# Assign that color scheme to HighLine...
HighLine.color_scheme = standard
