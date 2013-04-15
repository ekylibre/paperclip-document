module Paperclip

  # This processor extract the OCR text of the file
  class Textize < DocumentProcessor

    attr_accessor :clean, :text_column

    def initialize(file, options = {}, attachment = nil)
      super
      if @options[:text_column].nil? and text_column?
        @options[:text_column] = default_text_column
      end
      @text_column = @options[:text_column]
      @clean = !!(options.has_key?(:clean) ? options[:clean] : true)
    end

    # Extract the text of all the document
    def make
      dst = Pathname.new(Dir.tmpdir).join(file_path.basename.to_s)
        options = {:output => dst, :clean => @clean}
        Docsplit.extract_text(file_path.to_s, options)
      begin
      rescue
        raise Paperclip::Error, "There was an error during text extraction"
      end
      
      if text_column
        instance = @attachment.instance
        puts "Open " + dst
        f = File.open(dst)
        instance.class.update_all({text_column => f.read}, {:id => instance.id})
        f.close
      end

      return dst
    end
    
    # Check if the default text column is present
    def text_column?
      expected_column = default_text_column
      return @attachment.instance.class.columns.detect do |column|
        column.name.to_s == expected_column
      end
    end

    # Returns the name of the default text column
    def default_text_column
      @attachment.name.to_s + "_content_text"
    end

  end

end
