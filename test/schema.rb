ActiveRecord::Schema.define :version => "001" do
  create_table "documents", :force => true do |t|
    t.string  :name

    t.string  :original_file_name
    t.string  :original_content_type
    t.integer :original_updated_at
    t.integer :original_file_size
    t.text    :original_content_text
    t.integer :original_pages_count

    t.string  :freezed_file_name
    t.string  :freezed_content_type
    t.integer :freezed_updated_at
    t.integer :freezed_file_size
    t.text    :freezed_content_text
    t.integer :freezed_pages_count

    t.string  :readed_file_name
    t.string  :readed_content_type
    t.integer :readed_updated_at
    t.integer :readed_file_size
    t.integer :readed_pages_count

    t.string  :counted_file_name
    t.string  :counted_content_type
    t.integer :counted_updated_at
    t.integer :counted_file_size

    t.string  :sketched_file_name
    t.string  :sketched_content_type
    t.integer :sketched_updated_at
    t.integer :sketched_file_size

  end
end
