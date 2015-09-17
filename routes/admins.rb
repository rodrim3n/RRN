class Admins < Cuba
  define do

    on get, authenticated(User) do
      on root do
        render "admins/index"
      end

      on "new" do #new
        render "admins/new"
      end

      on "list" do
        render "admins/list", admins: User.all
      end

      on "edit/:id" do |id|
        render("admins/edit", admin: User.find(:id => id))
      end
    end

    on post, authenticated(User) do
      on root, param("username"), param("password") do |u, p| #create
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
      on ":id", param("oldpassword"), param("newpassword") do |id, old, new| #Update
        user = User.find(:id => id)
        if (Shield::Password.check(old, user.crypted_password))
          user.password = new
          user.save_changes
          session[:success] = "You have updated #{user.username} password."
          res.redirect "/admin", 302
        else
          session[:error] = "Old password doesn't match with new nigga."
          res.redirect "/admin/edit/#{user.id}", 302
        end
      end
    end

    on delete, authenticated(User) do #Destroy
      on "delete/:id" do |id|
        User.find(:id => id).destroy
        res.redirect "/admin/list", 302
      end
    end

    on default do
      res.status = 403
      res.write "403 - Forbidden."
    end
  end
end
