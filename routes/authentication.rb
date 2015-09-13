class Authentication < Cuba
  define do

    on get do
      on "login", !authenticated(User) do
        render "login"
      end
      on "logout", authenticated(User) do
        logout(User)
        session[:success] = "You have successfully logged out."
        res.redirect "/", 302
      end
    end

    on post do
      on "login", param("username"), param("password") do |u, p|
        if login(User, u, p)
          session[:success] = "You have successfully logged in."
          res.redirect "/admin", 302
        else
          session[:error] = "Invalid username and/or password combination."
          res.redirect "/auth/login", 302
        end
      end
    end
  end
end
