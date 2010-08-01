class User < ActiveRecord::Base
  using_access_control
  acts_as_authentic
  
  has_many :albums, :dependent => :delete_all
  has_many :roles, :dependent => :delete_all
  after_create :create_default_role
  
  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end
  
  def create_default_role
    if roles.empty?
      roles.create(:title => "user")
    end
  end
end
