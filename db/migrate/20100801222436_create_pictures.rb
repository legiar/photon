class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string  :photo_file_name
      t.string  :photo_content_type
      t.integer :photo_file_size
      
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
