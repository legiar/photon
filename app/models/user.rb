class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :albums, :dependent => :delete_all
  has_one :role, :dependent => :delete
  has_many :pictures
  after_create :create_default_role
  
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
  
  def create_default_role
    if role.nil?
      create_role(:title => "user")
    end
  end
end
