Warden::Manager.after_set_user do |user,auth,opts|
    scope = opts[:scope]
    auth.cookies.encrypted["#{scope}_id"] = user.id
  end
  
  Warden::Manager.before_logout do |user, auth, opts|
    scope = opts[:scope]
    auth.cookies.encrypted["#{scope}_id"] = nil
  end