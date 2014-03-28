module Paperclip
  module Document
    module Processors

      # This processor extract first page as thumbnail
      class Sketcher < Paperclip::Document::Processor

        attr_accessor :format, :density, :format

        def initialize(file, options = {}, attachment = nil)
          super(file, options, attachment)
          @format  = (options[:format] || :jpg).to_sym
          unless [:jpg, :png].include?(@format)
            raise Paperclip::Error, "Valid format must be specified"
          end
          unless @size = options[:size]
            @density = (options[:density] || 150).to_f
          end
        end

        # Extract the page
        def make
          destination_path = tmp_dir.to_s
          options = {:output => destination_path, :pages => [1], :format => [@format]}
          if @size
            options[:size] = @size
          elsif @density
            options[:density] = @density
          end
          Docsplit.extract_images(file_path.to_s, options)
          begin
          rescue
            raise Paperclip::Error, "There was an error extracting the first thumbnail from #{basename}"
          end
          return File.open(File.join(destination_path, basename + "_1.#{@format}"))
        end

      end


    end
  end
end
