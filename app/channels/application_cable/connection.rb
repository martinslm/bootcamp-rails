module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end
    
    protected
    
    def find_verified_user
      user_id = cookies.encrypted[:user_id]
    
      User.find_by(id: user_id) || reject_unauthorized_connection
    end
  end
end
