require "minitest/autorun"
require_relative "lib/typemotion_art_svg"

class TypeMotionArtSvgTest < Minitest::Test
  def test_escapes_text
    svg = TypeMotionArtSvg.render("<script>&")
    refute_includes svg, "<script>"
    assert_includes svg, "&lt;script&gt;&amp;"
  end

  def test_rejects_invalid_color
    assert_raises(ArgumentError) { TypeMotionArtSvg.render("hello", background: 'red" onload="x') }
  end
end
