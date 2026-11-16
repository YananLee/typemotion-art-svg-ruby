# frozen_string_literal: true

require "cgi"

module TypeMotionArtSvg
  def self.render(text, width: 800, height: 450, font_size: 64, text_color: "#ffffff", background: "#151624", duration: 1.2)
    raise ArgumentError, "text must not be empty" if text.to_s.strip.empty?
    raise ArgumentError, "maximum 12 lines" if text.to_s.lines.count > 12
    raise ArgumentError, "invalid size or duration" unless width.is_a?(Integer) && width.positive? && height.is_a?(Integer) && height.positive? && font_size.is_a?(Integer) && font_size.positive? && duration.is_a?(Numeric) && duration.finite? && duration.positive?
    raise ArgumentError, "colors must be #RRGGBB" unless [text_color, background].all? { |color| color.match?(/\A#[0-9a-fA-F]{6}\z/) }

    lines = text.to_s.gsub("\r\n", "\n").split("\n", -1)
    line_height = font_size * 1.2
    start_y = height / 2.0 - (lines.length - 1) * line_height / 2
    svg = +%(<svg xmlns="http://www.w3.org/2000/svg" width="#{width}" height="#{height}" viewBox="0 0 #{width} #{height}" role="img" aria-label="#{CGI.escapeHTML(text.to_s)}">)
    svg << %(<rect width="100%" height="100%" fill="#{background}"/>)
    lines.each_with_index do |line, index|
      y = start_y + index * line_height
      delay = index * 0.18
      svg << %(<text x="50%" y="#{format('%.1f', y)}" text-anchor="middle" dominant-baseline="middle" font-family="Arial, sans-serif" font-size="#{font_size}" fill="#{text_color}" opacity="0">#{CGI.escapeHTML(line)})
      svg << %(<animate attributeName="opacity" from="0" to="1" dur="#{format('%.2f', duration)}s" begin="#{format('%.2f', delay)}s" fill="freeze"/>)
      svg << %(<animateTransform attributeName="transform" type="translate" from="0 18" to="0 0" dur="#{format('%.2f', duration)}s" begin="#{format('%.2f', delay)}s" fill="freeze"/></text>)
    end
    svg << "</svg>"
  end
end
