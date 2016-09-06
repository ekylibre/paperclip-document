module Paperclip
  module Document
    module Processors
      autoload :Sketcher, 'paperclip/document/processors/sketcher'
      autoload :Reader,   'paperclip/document/processors/reader'
      autoload :Freezer,  'paperclip/document/processors/freezer'
      autoload :Counter,  'paperclip/document/processors/counter'
    end
  end
end
