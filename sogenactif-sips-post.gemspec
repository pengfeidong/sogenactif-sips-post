# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sogenactif/sips/post/version'

Gem::Specification.new do |spec|
  spec.name          = "sogenactif-sips-post"
  spec.version       = Sogenactif::Sips::Post::VERSION
  spec.authors       = ["pengfei"]
  spec.email         = ["pengfei.dong@external.engie.com"]

  spec.summary       = %q{Module de paiement pour Sogenactif SIPS avec Post }
  spec.description   = %q{La gem sogenactif-sips-post permet d'intégrer la méthode de paiement de Sogenactif à votre site Web.}
  spec.homepage      = "https://github.com/pengfeidong/sogenactif-sips-post"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

end
