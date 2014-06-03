# encoding: utf-8
require 'helper'

class TestMacro < Paperclip::Document::TestCase

  def test_freezer
    assert_raises ActiveRecord::RecordInvalid do
      f = File.open(fixtures.join("example.pdf"))
      document = Document.create!(:name => "My first document", :freezed => f)
      f.close
    end    
  end

  def test_reader
    assert_raises ActiveRecord::RecordInvalid do
      f = File.open(fixtures.join("example.pdf"))
      document = Document.create!(:name => "My first document", :readed => f)
      f.close
    end    
  end

  def test_counter
    assert_raises ActiveRecord::RecordInvalid do
      f = File.open(fixtures.join("example.pdf"))
      document = Document.create!(:name => "My first document", :counted => f)
      f.close
    end    
  end

  def test_sketcher
    assert_raises ActiveRecord::RecordInvalid do
      f = File.open(fixtures.join("example.pdf"))
      document = Document.create!(:name => "My first document", :sketched => f)
      f.close
    end    
  end

end
