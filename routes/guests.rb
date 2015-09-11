class Guests < Cuba
  define do
    on get, "signup", !authenticated(User) do
      render("guests/signup", msg: "")
    end

    on post, "signup", param("username"), param("password") do |u, p|
      # user = User.new(:username => u, :crypted_password => p)
      user = User.new
      user.username= u
      user.password= p
      begin
        if user.save
          authenticate(user)
          session[:success] = "You have successfully signed up."
          render("home", msg: session[:success])
        end
      rescue Sequel::ValidationFailed
        session[:error] = "Username already in use."
        render("guests/signup", msg: session[:error])
      end
    end

    on get, "login" do
      on get do
        render("guests/login")
      end
    end

    on post, "login", param("username"), param("password") do |u, p|
      if login(User, u, p)
        session[:success] = "You have successfully logged in."
        render("admins/index", msg: session[:success])
      else
        session[:error] = "Invalid username and/or password combination."
        render("guests/login", msg: session[:error])
      end
    end
  end
end
