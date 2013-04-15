require "paperclip/document/version"
require "docsplit"
require "pathname"

module Paperclip
  # Main processor
  class DocumentProcessor < Processor
    
    def initialize(file, options = {}, attachment = nil)
      super(file, options, attachment)
    end
    
    def file_path
      Pathname.new(@file.path)
    end
    
  end
end

require "paperclip/document/processors"
