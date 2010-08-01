authorization do
  role :guest do
    has_permission_on [:albums], :to => :read
    has_permission_on :users, :to => :update
  end
  
  role :user do
    includes :guest
    has_permission_on :user, :to => :update do
      if_attribute :user_id => is {user.id}
    end
  end
  
  role :admin do
    has_permission_on [:albums, :users], :to => :manage
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => [:new]
  privilege :update, :includes => [:show, :edit, :create, :delete]
  privilege :delete, :includes => [:destroy]
end