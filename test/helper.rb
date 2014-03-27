require 'paperclip'
require 'paperclip/railtie'
require 'active_record'
require 'pathname'
require 'paperclip/document'
require 'test/unit'

# Connect to sqlite
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => ":memory:"
)

ActiveRecord::Base.logger = Logger.new(nil)
load(File.join(File.dirname(__FILE__), 'schema.rb'))

Paperclip::Railtie.insert

class Document < ActiveRecord::Base
  has_attached_file(:original,
                    :storage => :filesystem,
                    :path => "./tmp/documents/:id/:style.:extension",
                    :url => "/tmp/:id.:extension",
                    :styles => {
                      :archive => {:clean => true, :format => :pdf, :processors => [:reader, :counter, :freezer]},
                      :thumbnail => {:processors => [:sketcher], :format => :jpg}
                    })
  validates_attachment_content_type :original, :content_type => /application/
end



class Paperclip::Document::TestCase < Test::Unit::TestCase

  def fixtures
    Pathname.new(__FILE__).dirname.join("fixtures")
  end
end
