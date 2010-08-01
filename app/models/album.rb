class Album < ActiveRecord::Base
  using_access_control
  
  belongs_to :user
end
