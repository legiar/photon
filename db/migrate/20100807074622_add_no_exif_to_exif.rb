class AddNoExifToExif < ActiveRecord::Migration
  def self.up
    add_column :exifs, :no_exif, :boolean, :default => 0
  end

  def self.down
    remove_column :exifs, :no_exif
  end
end
