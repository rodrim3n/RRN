class Guests < Cuba
  define do
    on get, "signup", !authenticated(User) do
      render("signup", msg: "")
    end

    on post, "signup", param("username"), param("password") do |u, p|
      user = User.new(:username => u, :crypted_password => p)
      begin
        if user.save
          authenticate(user)
          session[:success] = "You have successfully signed up."
          render("home", msg: session[:success])
        end
      rescue Sequel::ValidationFailed
        session[:error] = user.errors
        render("signup", msg: session[:error])
      end
    end

    on get, "login" do
      on get do
        render("login")
      end
    end

  #   on post, "login", param("username"), param("password") do |u, p|
  #     if login(User, u, p)
  #       session[:success] = "You have successfully logged in."
  #       res.redirect("/admin")
  #       p "te logueaste"
  #     else
  #       session[:error] = "Invalid username and/or password combination."
  #       p "no pudiste loguearte"
  #     end
  #   end
  # end

  end
end
