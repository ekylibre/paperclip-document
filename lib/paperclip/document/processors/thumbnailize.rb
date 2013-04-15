module Paperclip

  # This processor extract first page as thumbnail
  class Thumbnailize < DocumentProcessor

    attr_accessor :format, :density, :format

    def initialize(file, options = {}, attachment = nil)
      super
      @format  = options[:format] || "jpg"
      unless @size = options[:size]
        @density = (options[:density] || 150).to_f
      end
    end

    # Extract the page
    def make
      dst = Tempfile.new(file_path.basename.to_s).to_s
      begin
        options = {:output => dst, :pages => [1]}
        if @size
          options[:size] = @size
        elsif @density
          options[:density] = @density
        end
        Docsplit.extract_images(file_path.to_s, options)
      rescue
        raise Paperclip::Error, "There was an error extracting the first thumbnail from #{@basename}"
      end
      return dst
    end

  end


end
