 $:.push File.expand_path("../lib", __FILE__)
 require "traktical/version"

 Gem::Specification.new do |s|
   s.name        = "traktical"
   s.version     = VERSION
   s.authors     = ["Grzegorz Lachowski"]
   s.email       = ["gregory.lachowski@gmail.com"]
   s.homepage    = "https://github.com/gregorl/traktical"
   s.summary     = %q{Simple subtitles converter (.txt to .srt)}
   s.description = %q{Simple subtitles converter (.txt to .srt)}

   s.rubyforge_project = "traktical"

   s.files         = `git ls-files`.split("\n")
   s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
   s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
   s.require_paths = ["lib"]

   s.add_dependency('ri_cal')

 end
