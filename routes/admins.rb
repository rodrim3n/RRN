class Admins < Cuba
  define do

    on get, authenticated(User) do
      on root, is_admin? do
        render "admins/index", users: User.all
      end

      on "new", is_admin? do
        render "admins/new"
      end

      on "edit/:id" do |id|
        render("admins/edit", admin: User.find(:id => id))
      end
    end

    on post, authenticated(User), is_admin? do
      on root, param("username"), param("password") do |u, p|
        user = User.new
        user.username= u
        user.password= p
        begin
          if user.save
            session[:success] = "New admin reated successfully."
            res.redirect "/admin", 302
          end
        rescue Sequel::ValidationFailed
          session[:error] = "Username already in use."
          res.redirect "admin/new"
        end
      end
    end

    on put, authenticated(User) do
      on ":id", param("oldpassword"), param("newpassword") do |id, old, new|
        user = User.find(:id => id)
        if (Shield::Password.check(old, user.crypted_password))
          user.password = new
          user.save_changes
          session[:success] = "You have updated your password."
          res.redirect "/", 302
        else
          session[:error] = "Old password doesn't match with new nigga."
          res.redirect "/admin/edit/#{user.id}", 302
        end
      end

      on ":id", is_admin?, param("newpassword") do |id, new|
        user = User.find(:id => id)
        user.password = new
        user.save_changes
        session[:success] = "You have updated #{user.username}'s password."
        res.redirect "/", 302
      end
    end

    on delete, authenticated(User), is_admin? do
      on "delete/:id" do |id|
        User.find(:id => id).destroy
        res.redirect "/admin", 302
      end
    end

    on default do
      res.status = 403
      res.write "403 - Forbidden."
    end
  end
end
