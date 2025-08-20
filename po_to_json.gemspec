# frozen_string_literal: true

#
# Copyright (c) 2012-2015 Dropmysite.com <https://dropmyemail.com>
# Copyright (c) 2015 Webhippie <http://www.webhippie.de>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "po_to_json/version"

Gem::Specification.new do |s|
  s.name = "po_to_json"
  s.version = PoToJson::Version
  s.platform = Gem::Platform::RUBY

  s.authors = ["Thomas Boerger", "Nubis"]
  s.email = ["thomas@webhippie.de", "nubis@woobiz.com.ar"]

  s.summary = <<-EOF
    Convert gettext PO files to JSON
  EOF

  s.description = <<-EOF
    Convert gettext PO files to JSON objects so that you can use it in your
    application.
  EOF

  s.homepage = "https://github.com/webhippie/po_to_json"
  s.license = "MIT"

  s.files = ["CHANGELOG.md", "README.md", "LICENSE"]
  s.files += Dir.glob("lib/**/*")
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 1.9.3"
  s.metadata["rubygems_mfa_required"] = "true"

  s.add_dependency "json", ">= 1.6.0"
end
