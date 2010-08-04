class CreateMetadatas < ActiveRecord::Migration
  def self.up
    create_table :metadatas do |t|
      t.integer :picture_id
      t.string  :name
      t.text    :description
      t.timestamps
    end
  end

  def self.down
    drop_table :metadatas
  end
end
