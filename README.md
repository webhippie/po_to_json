## po_to_json

Convert gettext PO files to json to use in your javascript app, based po2json.pl (by DuckDuckGo, Inc. http://duckduckgo.com/, Torsten Raudssus <torsten@raudss.us>.

Ideally you'll use this on a rake task that creates json versions of your po files, which can later be used from javascript
with Jed ( http://slexaxton.github.com/Jed/ )

## Installing 

Via rubygems:
```ruby
gem install po_to_json
```

In your gemfile:
```ruby
gem 'po_to_json'
```

## Usage

Simply parses a po file generating the corresponding JSON encoded string.

```ruby
require 'po_to_json'
json_string = PoToJson.new.parse_po('/path/to/your/translations.po')
```

## Maintainers

* eromirou (https://github.com/eromirou)
* Nubis (https://github.com/nubis)

## License

MIT License. Copyright 2012 Dropmysite.com. https://dropmyemail.com
