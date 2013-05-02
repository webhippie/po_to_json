Gem::Specification.new do |s|
  s.name              = 'po_to_json'
  s.version           = '0.0.7'
  s.date              = '2013-05-02'
  s.summary           = 'Convert gettext PO files to json'
  s.description       = 'Convert gettext PO files to json to use in your javascript app, based po2json.pl (by DuckDuckGo, Inc. http://duckduckgo.com/, Torsten Raudssus <torsten@raudss.us>.)'
  s.authors           = ["Nubis", "eromirou"]
  s.email             = 'nubis@woobiz.com.ar'
  s.files             = Dir["lib/**/*"] + ["README.md", "MIT-LICENSE"]
  s.homepage          = "https://github.com/nubis/po_to_json"
  s.add_dependency 'json'
end
