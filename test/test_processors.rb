# encoding: utf-8
require 'helper'

class TestProcessors < Paperclip::Document::TestCase

  def test_odt
    f = File.open(fixtures.join("example.odt"))
    document = Document.create!(:name => "My first document", :original => f)
    f.close

    document.reload
    assert_equal 1, document.original.pages_count

    assert !document.original.content_text.nil?
    assert document.original.content_text.match("This is an example.")
  end

  def test_pdf
    f = File.open(fixtures.join("example.pdf"))
    document = Document.create!(:name => "My second document", :original => f)
    f.close

    document.reload
    assert_equal 1, document.original.pages_count

    assert !document.original.content_text.nil?
    assert document.original.content_text =~ /This is an example./
  end

  def test_docx
    f = File.open(fixtures.join("example.docx"))
    document = Document.create!(:name => "My third document", :original => f)
    f.close

    document.reload
    assert_equal 1, document.original.pages_count

    assert !document.original.content_text.nil?
    assert document.original.content_text.match("This is an example.")
  end

end
