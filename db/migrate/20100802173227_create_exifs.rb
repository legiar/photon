class CreateExifs < ActiveRecord::Migration
  def self.up
    create_table :exifs do |t|
      t.integer :exposure_program
      t.float :digital_zoom_ratio # => rational
      t.string  :subsec_time
      t.string  :gps_latitude_ref
      t.integer :ycb_cr_positioning
      t.datetime  :date_time_digitized
      t.integer :sharpness
      t.integer :flash
      t.float :gps_time_stamp  # => rational
      t.datetime :gps_date_stamp
      t.string  :gps_map_datum
      t.string  :make
      t.string  :subsec_time_original
      t.integer :focal_length_in_35mm_film
      t.float :exposure_bias_value  # => rational
      t.float :gps_latitude      # => rational
      t.float :reference_black_white # => rational
      t.float :focal_length # => rational
      t.string  :gps_satellites
      t.string  :software
      t.string  :model
      t.integer :isu_speed_ratings
      t.string  :subsec_time_digitized
      t.integer :scene_capture_type
      t.float :max_aperture_value # => rational
      t.string  :gps_longitude_ref
      t.integer :custom_rendered
      t.integer :subject_distance_range
      t.datetime  :date_time
      t.integer :gain_control
      t.float :gps_longitude  # => rational
      t.integer :exposure_mode
      t.float :exposure_time  # => rational
      t.float :x_resolution # => rational
      t.integer :color_space
      t.integer :contrast
      t.integer :sensing_method
      t.integer :metering_mode
      t.string  :gps_altitude_ref
      t.string  :user_comment
      t.integer :white_balance
      t.float :f_number # => rational
      t.string  :gps_version_id
      t.float :y_resolution # => rational
      t.integer :light_source
      t.integer :saturation
      t.datetime :date_time_original
      t.float :gps_altitude # => rational
      t.integer :resolution_unit
      
      
      t.references :picture
      t.timestamps
    end
  end

  def self.down
    drop_table :exifs
  end
end
