require 'filemagic'

module Paperclip

  # This processor extract first page as thumbnail
  class Freezer < DocumentProcessor
    def initialize(file, options = {}, attachment = nil)
      super
      @format = options[:format]
      unless @format == :pdf
        raise Paperclip::Error, "Valid format (pdf) must be specified"
      end
    end

    # Convert the document to pdf
    def make
      destination_path = tmp_dir.to_s
      destination_file = File.join(destination_path, basename + ".#{@format}")
      if pdf_format?
        destination_file = file_path.to_s
      else
        Docsplit.extract_pdf(file_path.to_s, :output => destination_path)
      end
      return File.open(destination_file)
    end


    def pdf_format?
      file_magic = FileMagic.new
      type = file_magic.file(file_path.to_s)
      file_magic.close
      type =~ /pdf/i
    end

  end


end
