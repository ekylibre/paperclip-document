require "paperclip/document/version"
require "docsplit"
require "pathname"

module Paperclip
  # Main processor
  class DocumentProcessor < Processor
    
    attr_reader :instance, :tmp_dir

    def initialize(file, options = {}, attachment = nil)
      super(file, options, attachment)
      @instance = @attachment.instance
      @tmp_dir = Pathname.new(Dir.tmpdir).join("paperclip-document", instance.class.name, attachment.name.to_s, basename, Time.now.to_i.to_s(36) + "-" + rand(1_000_000).to_s(36))
    end
    
    def file_path
      Pathname.new(@file.path)
    end

    def basename
      file_path.basename.to_s.gsub(/\.[^\.]+/, '')
    end
    
  end

  class Attachment

    # Returns the content_text of the file as originally extracted, and lives in the <attachment>_content_text attribute of the model.
    def content_text
      instance_read(:content_text)
    end

    # Returns the pages_count of the file as originally computed, and lives in the <attachment>_pages_count attribute of the model.
    def pages_count
      instance_read(:pages_count)
    end

  end
  

end

require "paperclip/document/processors"
