class Admins < Cuba
  define do
    on "logout" do
      session[:success] = "You have successfully logged out."
      logout(User)
      res.redirect "/", 303
    end
  end
end
