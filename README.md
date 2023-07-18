# po_to_json

[![Test Status](https://github.com/webhippie/po_to_json/actions/workflows/testing.yml/badge.svg)](https://github.com/webhippie/po_to_json/actions/workflows/testing.yaml) [![Join the Matrix chat at https://matrix.to/#/#webhippie:matrix.org](https://img.shields.io/badge/matrix-%23webhippie%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#webhippie:matrix.org) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/6e015952f83d42d4bfc7e335d856554a)](https://app.codacy.com/gh/webhippie/po_to_json/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade) [![Gem Version](https://badge.fury.io/rb/po_to_json.svg)](https://badge.fury.io/rb/po_to_json)

Convert gettext PO files to JSON to use in your javascript app, based on
po2json.pl by [DuckDuckGo, Inc.](http://duckduckgo.com/). Ideally you'll use
this on a Rake task that creates JSON versions of your PO files, which can
later be used from javascript with [Jed](http://slexaxton.github.io/Jed/)


## Versions

For a list of the tested and supported Ruby and JSON versions please take a
look at the [wokflow][workflow].

## Installation

```ruby
gem "po_to_json", "~> 2.0"
```

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations
of this scheme should be reported as bugs. Specifically, if a minor or patch
version is released that breaks backward compatibility, a new version should be
immediately released that restores compatibility. Breaking changes to the public
API will only be introduced with new major versions.

As a result of this policy, you can (and should) specify a dependency on this
gem using the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example:

```ruby
spec.add_dependency "po_to_json", "~> 2.0"
```

## Usage

Most common use would be to generate a Jed ready javascript file. For example,
in a Rails project:

```ruby
require "po_to_json"

json = PoToJson.new(
  Rails.root.join("locale", "de", "app.po")
).generate_for_jed("de")

Rails.root.join(
  "app",
  "assets",
  "javascripts",
  "locale",
  "de",
  "app.js"
).write(json)
```

If you need a pretty json, add `pretty: true` to `generate_for_jed`, like the
following example:

```ruby
require "po_to_json"

json = PoToJson.new(
  Rails.root.join("locale", "de", "app.po")
).generate_for_jed("de", pretty: true)

Rails.root.join(
  "app",
  "assets",
  "javascripts",
  "locale",
  "de",
  "app.js"
).write(json)
```

The javascript file generated has a global "locales" object with an attribute
corresponding to the generated language:

```javascript
i18n = new Jed(locales["de"])
i18n.gettext("Hello World") // Should evaluate to "Hallo Welt"
```

## Contributing

Fork -> Patch -> Spec -> Push -> Pull Request

## Authors

*   [Thomas Boerger](https://github.com/tboerger)
*   [Nubis](https://github.com/nubis)
*   [Other contributors](https://github.com/webhippie/po_to_json/graphs/contributors)

## License

MIT

## Copyright

```
Copyright (c) 2012-2015 Dropmysite.com <https://dropmyemail.com>
Copyright (c) 2015 Webhippie <http://www.webhippie.de>
```

[workflow]: https://github.com/webhippie/po_to_json/blob/master/.github/workflows/testing.yml
[semver]: http://semver.org
[pvc]: http://guides.rubygems.org/patterns/#pessimistic-version-constraint
