
require 'helper'

class TestMacro < Paperclip::Document::TestCase
  def test_freezer
    assert_raises Paperclip::Error do
      f = File.open(fixtures.join('example.pdf'))
      Document.create!(name: 'My frozen document', freezed: f)
      f.close
    end
  end

  def test_reader
    assert_raises Paperclip::Error do
      f = File.open(fixtures.join('example.pdf'))
      Document.create!(name: 'My read document', readed: f)
      f.close
    end
  end

  def test_counter
    assert_raises Paperclip::Error do
      f = File.open(fixtures.join('example.pdf'))
      Document.create!(name: 'My counted document', counted: f)
      f.close
    end
  end

  def test_sketcher
    assert_raises Paperclip::Error do
      f = File.open(fixtures.join('example.pdf'))
      Document.create!(name: 'My sketched document', sketched: f)
      f.close
    end
  end
end
