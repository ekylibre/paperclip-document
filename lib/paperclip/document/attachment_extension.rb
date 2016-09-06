module Paperclip
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
