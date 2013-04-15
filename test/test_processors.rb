# encoding: utf-8
require 'helper'

class TestProcessors < Paperclip::Document::TestCase

  def test_all
    f = File.open(fixtures.join("example.odt"))
    Document.create!(:name => "My first document", :original => f)
    f.close
    assert_equal 1, Document.count

    document = Document.first
    assert_equal 1, document.original_pages_count

  end

end
