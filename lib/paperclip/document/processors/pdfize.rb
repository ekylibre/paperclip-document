module Paperclip

  # This processor extract first page as thumbnail
  class Pdfize < DocumentProcessor

    # Convert the document to pdf
    def make
      dst = Tempfile.new(file_path.basename.to_s).to_s
      begin
        Docsplit.extract_pdf(file_path.to_s, :output => dst)
      rescue
        raise Paperclip::Error, "There was an error during document freezing"
      end
      return dst
    end

  end


end
