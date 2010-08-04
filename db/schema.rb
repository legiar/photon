# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100802173227) do

  create_table "albums", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "exifs", :force => true do |t|
    t.integer  "exposure_program"
    t.float    "digital_zoom_ratio"
    t.string   "subsec_time"
    t.string   "gps_latitude_ref"
    t.integer  "ycb_cr_positioning"
    t.datetime "date_time_digitized"
    t.integer  "sharpness"
    t.integer  "flash"
    t.float    "gps_time_stamp"
    t.datetime "gps_date_stamp"
    t.string   "gps_map_datum"
    t.string   "make"
    t.string   "subsec_time_original"
    t.integer  "focal_length_in_35mm_film"
    t.float    "exposure_bias_value"
    t.float    "gps_latitude"
    t.float    "reference_black_white"
    t.float    "focal_length"
    t.string   "gps_satellites"
    t.string   "software"
    t.string   "model"
    t.integer  "isu_speed_ratings"
    t.string   "subsec_time_digitized"
    t.integer  "scene_capture_type"
    t.float    "max_aperture_value"
    t.string   "gps_longitude_ref"
    t.integer  "custom_rendered"
    t.integer  "subject_distance_range"
    t.datetime "date_time"
    t.integer  "gain_control"
    t.float    "gps_longitude"
    t.integer  "exposure_mode"
    t.float    "exposure_time"
    t.float    "x_resolution"
    t.integer  "color_space"
    t.integer  "contrast"
    t.integer  "sensing_method"
    t.integer  "metering_mode"
    t.string   "gps_altitude_ref"
    t.string   "user_comment"
    t.integer  "white_balance"
    t.float    "f_number"
    t.string   "gps_version_id"
    t.float    "y_resolution"
    t.integer  "light_source"
    t.integer  "saturation"
    t.datetime "date_time_original"
    t.float    "gps_altitude"
    t.integer  "resolution_unit"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metadatas", :force => true do |t|
    t.integer  "picture_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.boolean  "photo_processing"
    t.integer  "user_id"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string  "title"
    t.integer "user_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "login",                               :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",               :default => "", :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "password_salt",                       :null => false
    t.string   "persistence_token",                   :null => false
    t.string   "perishable_token",    :default => "", :null => false
    t.string   "single_access_token"
    t.integer  "login_count",         :default => 0,  :null => false
    t.integer  "failed_login_count",  :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
