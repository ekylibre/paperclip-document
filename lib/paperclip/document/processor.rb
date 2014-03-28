module Paperclip
  module Document
    
    # Main processor
    class Processor < Paperclip::Processor
      
      attr_reader :instance, :tmp_dir
      
      def initialize(file, options = {}, attachment = nil)
        super(file, options, attachment)
        @instance = @attachment.instance
        @tmp_dir = Pathname.new(Dir.tmpdir).join("paperclip-document-" + Time.now.to_i.to_s(36) + rand(1_000_000_000).to_s(36))
      end
      
      def file_path
        Pathname.new(@file.path)
      end

      def basename
        file_path.basename.to_s.gsub(/\.[^\.]+/, '')
      end
      
    end
  end
end
