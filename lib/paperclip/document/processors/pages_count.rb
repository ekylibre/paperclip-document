module Paperclip

  # This processor extract the OCR text of the file
  class PagesCount < DocumentProcessor

    attr_accessor :pages_count_column

    def initialize(file, options = {}, attachment = nil)
      super
      if @options[:pages_count_column].nil? and pages_count_column?
        @options[:pages_count_column] = default_pages_count_column
      end
      @pages_count_column = @options[:pages_count_column]

      unless @pages_count_column
        raise Paperclip::Error, "No pages_count column given"
      end
    end

    # Extract the pages count of all the document
    def make
      dst = @file
      count = nil
      begin
        count = Docsplit.extract_length(file_path.to_s)
      rescue
        raise Paperclip::Error, "There was an error during pages count extraction"
      end
      
      puts "Count: #{count}"

      instance = @attachment.instance
      instance.class.update_all({pages_count_column => count}, {:id => instance.id})

      return dst
    end
    
    # Check if a pages count column is present
    def pages_count_column?
      expected_column = default_pages_count_column
      return @attachment.instance.class.columns.detect do |column|
        column.name.to_s == expected_column
      end
    end

    # Returns the name of the default pages count column
    def default_pages_count_column
      @attachment.name.to_s + "_pages_count"
    end

  end

end
