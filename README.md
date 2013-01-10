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

Most common use would be to generate a Jed ready javascript file. For example, in a Rails 3 project:

```ruby
require 'po_to_json'
json_string = PoToJson.new("#{Rails.root}/locale/es/app.po").generate_for_jed('es')
File.open("#{Rails.root}/app/assets/javascripts/locale/es/app.js",'w').write(json_string)
```

If you need a pretty json, add `:pretty => true` to `generate_for_jed`, like

```ruby
json_string = PoToJson.new("#{Rails.root}/locale/es/app.po").generate_for_jed('es', :pretty => true)
```

The javascript file generated has a global 'locales' object with an attribute corresponding to the generated language:

```javascript
i18n = new Jed(locales['es'])
i18n.gettext('Hello World') // Should evaluate to 'Hola Mundo'
```

## Maintainers

* eromirou (https://github.com/eromirou)
* Nubis (https://github.com/nubis)

## License

MIT License. Copyright 2012 Dropmysite.com. https://dropmyemail.com
