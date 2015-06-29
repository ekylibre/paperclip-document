module Paperclip
  module Document
    module Processors

      # This processor extract the OCR text of the file
      class Reader < Paperclip::Document::Processor

        attr_accessor :clean, :text_column, :language

        def initialize(file, options = {}, attachment = nil)
          super(file, options, attachment)
          if @options[:text_column].nil? and text_column?
            @options[:text_column] = default_text_column
          end
          @language = @options[:language]
          @text_column = @options[:text_column]
          unless @text_column
            raise Paperclip::Error, "No content text column given"
          end
          @clean = (RUBY_VERSION >= "2.0" ? false : options.has_key?(:clean) ? !!options[:clean] : true)
        end

        # Extract the text of all the document
        def make
          destination_path = tmp_dir.to_s
          options = {output: destination_path, clean: @clean}
          options[:language] = (language.is_a?(Proc) ? language.call(attachment.instance) : language)
          Docsplit.extract_text(file_path.to_s, options)
          
          destination_file = File.join(destination_path, basename + ".txt")
          instance = @attachment.instance
          f = File.open(destination_file)
          instance[text_column] = f.read
          instance.run_callbacks(:save) { false }
          f.close

          return File.open(file.path)
        end
        
        # Check if the default text column is present
        def text_column?
          expected_column = default_text_column
          return instance.class.columns.detect do |column|
            column.name.to_s == expected_column
          end
        end

        # Returns the name of the default text column
        def default_text_column
          @attachment.name.to_s + "_content_text"
        end

      end

    end
  end
end
