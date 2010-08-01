class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # login => User login
      t.string    "login", :null => false
      t.string    "firstname"
      t.string    "lastname"
      t.string    "email", :default => "", :null => false
      t.string    "crypted_password", :null => false
      t.string    "password_salt", :null => false
      # persistence_token => required | User internally in Authlogic for
      # cookie and session
      t.string    "persistence_token", :null => false
      # See Authlogic::Session::Perishability
      # For password reset
      t.string    "perishable_token", :default => "", :null => false
      # See Authlogic::Session::Params
      # For ?user_credentials=[single access token]
      # For scripts, feeds etc.
      t.string    "single_access_token"
      
      # See Authlogic::Session::MagicColums
      # All optional, but can be usefull in this app
      t.integer   :login_count, :default => 0, :null => false
      t.integer   :failed_login_count, :default => 0, :null => false
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
