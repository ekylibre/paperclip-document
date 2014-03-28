require "paperclip/document/version"
require "paperclip/document/attachment_extension"
require "docsplit"
require "pathname"

module Paperclip
  module Document
    autoload :Processor,  'paperclip/document/processor'
    autoload :Processors, 'paperclip/document/processors'
  end

  configure do |c|
    c.register_processor :sketcher, Document::Processors::Sketcher
    c.register_processor :reader,   Document::Processors::Reader
    c.register_processor :freezer,  Document::Processors::Freezer
    c.register_processor :counter,  Document::Processors::Counter
  end

end

