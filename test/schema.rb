ActiveRecord::Schema.define :version => "001" do
  create_table "documents", :force => true do |t|
    t.string  :name
    t.string  :original_file_name
    t.string  :original_content_type
    t.integer :original_updated_at
    t.integer :original_file_size
    t.text    :original_content_text
    t.integer :original_pages_count
  end
end
