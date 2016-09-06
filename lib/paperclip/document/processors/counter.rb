module Paperclip
  module Document
    module Processors
      # This processor extract the OCR text of the file
      class Counter < Paperclip::Document::Processor
        attr_accessor :pages_count_column

        def initialize(file, options = {}, attachment = nil)
          super(file, options, attachment)
          if @options[:pages_count_column].nil? && pages_count_column?
            @options[:pages_count_column] = default_pages_count_column
          end
          @pages_count_column = @options[:pages_count_column]

          unless @pages_count_column
            raise Paperclip::Error, 'No pages count column given'
          end
        end

        # Extract the pages count of all the document
        def make
          count = Docsplit.extract_length(file_path.to_s)

          instance[pages_count_column] = count
          instance.run_callbacks(:save) { false }

          File.open(file.path)
        end

        # Check if a pages count column is present
        def pages_count_column?
          expected_column = default_pages_count_column
          @attachment.instance.class.columns.detect do |column|
            column.name.to_s == expected_column
          end
        end

        # Returns the name of the default pages count column
        def default_pages_count_column
          @attachment.name.to_s + '_pages_count'
        end
      end
    end
  end
end
