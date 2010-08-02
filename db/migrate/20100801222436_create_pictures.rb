class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string  :picture_file_name
      t.string  :picture_content_type
      t.integer :picture_file_size
      
      t.boolean :picture_processing
      
      t.integer :user_id
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
