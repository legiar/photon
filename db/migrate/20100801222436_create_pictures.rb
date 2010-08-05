class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string  :photo
      t.string  :name
      
      t.boolean :photo_processing
      t.boolean :to_process, :default => true
      
      t.integer :user_id
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
