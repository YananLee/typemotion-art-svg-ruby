Gem::Specification.new do |spec|
  spec.name = "typemotion_art_svg"
  spec.version = "0.1.1"
  spec.summary = "Generate a simple animated text SVG"
  spec.description = "A small local SVG generator for embeddable text entrance animations."
  spec.authors = ["TypeMotion.Art"]
  spec.homepage = "https://www.typemotion.art/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6"
  spec.files = Dir["lib/**/*.rb", "README.md", "LICENSE"]
  spec.require_paths = ["lib"]
  spec.metadata = { "source_uri" => "https://github.com/YananLee/typemotion-art-svg-ruby" }
end
