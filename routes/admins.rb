class Admins < Cuba
  define do
    on root do
      render("admins/index")
    end

    on "logout" do
      logout(User)
      session[:success] = "You have successfully logged out."
      render("home", msg: session[:success])
    end
  end
end
