class Login < Cuba
  define do

    on get do
      on root do
        render "login"
      end
    end

    on post do
      on root, param("username"), param("password") do |u, p|
        if login(User, u, p)
          session[:success] = "You have successfully logged in."
          res.redirect "admin", 302
        else
          session[:error] = "Invalid username and/or password combination."
          res.redirect "login", 302
        end
      end
    end
  end
end
