class Admins < Cuba
  define do

    on get do
      on root do
        render("admins/index")
      end

      on "new" do #new
        render "admin/new"
      end

      on "list" do
        render("admins/list", admins: User.all)
      end

      on "logout" do
        logout(User)
        session[:success] = "You have successfully logged out."
        res.redirect "/", 302
      end
    end

    on post do
      on root, param("username"), param("password") do |u, p| #create
        user = User.new
        user.username= u
        user.password= p
        begin
          if user.save
            session[:success] = "New admin created successfully."
            res.redirect "/admin", 302
          end
        rescue Sequel::ValidationFailed
          session[:error] = "Username already in use."
          render("admin/new")# msg: session[:error])
        end
      end
    end

    on delete do
      pass
    end

    on put do
      pass
    end
  end
end
