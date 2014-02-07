# Paperclip::Document

[![Gem Version](https://badge.fury.io/rb/paperclip-document.png)](http://badge.fury.io/rb/paperclip-document) 
[![Dependency Status](https://gemnasium.com/burisu/paperclip-document.png)](https://gemnasium.com/burisu/paperclip-document)
[![Quality metrics](https://codeclimate.com/github/burisu/paperclip-document.png)](https://codeclimate.com/github/burisu/paperclip-document)
[![Continuous Integration](https://api.travis-ci.org/burisu/paperclip-document.png?branch=master)](https://travis-ci.org/burisu/paperclip-document)
[![Code coverage](https://coveralls.io/repos/burisu/paperclip-document/badge.png?branch=master)](https://coveralls.io/r/burisu/paperclip-document)

Document processors for paperclip.

## Installation

Add this line to your application's Gemfile:

    gem 'paperclip-document'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-document

## Usage

Use processors like the example:

    has_attached_file :file, {
      styles: {
        default:   {format: :pdf, processors: [:reader, :counter, :freezer], clean: true},
        thumbnail: {format: :jpg, processors: [:sketcher]}
      }
    }

Due to docsplit dependency (0.7.2), text cleaning is only effective on Ruby < 2.0 for now.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
