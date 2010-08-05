class CreateExifs < ActiveRecord::Migration
  def self.up
    create_table :exifs do |t|
      t.integer   :width
      t.integer   :height
      t.string    :camera_brand
      t.string    :camera_model
      t.string    :exposure_time
      t.float     :f_number
      t.integer   :iso_speed_rating
      t.float     :focale_length
      t.datetime  :shot_date_time
      t.float     :gps_latitude
      t.float     :gps_longitude
      t.integer   :flash

      t.references :picture
      t.timestamps
    end
  end

  def self.down
    drop_table :exifs
  end
end
