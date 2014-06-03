require 'coveralls'
Coveralls.wear!
require 'paperclip'
require 'paperclip/railtie'
require 'active_record'
require 'pathname'
require 'paperclip/document'
require 'minitest/autorun'

I18n.enforce_available_locales = false

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

  has_attached_file(:freezed, styles: {archive: {format: :jpg, processors: [:freezer]}})
  validates_attachment_content_type :freezed, content_type: /application/

  has_attached_file(:readed, styles: {archive: {processors: [:reader]}})
  validates_attachment_content_type :readed, content_type: /application/

  has_attached_file(:counted, styles: {archive: {processors: [:counter]}})
  validates_attachment_content_type :counted, content_type: /application/

  has_attached_file(:sketched, styles: {archive: {format: :pdf, processors: [:sketcher]}})
  validates_attachment_content_type :sketched, content_type: /application/

end



class Paperclip::Document::TestCase < MiniTest::Test

  def fixtures
    Pathname.new(__FILE__).dirname.join("fixtures")
  end
end
