class Notes < Cuba
  define do
    on get do
      on root do #Index
        render("notes/index", notes: Note.all)
      end

      on "new" do #New
        render("notes/new")
      end

      on ":id" do |id|
        on root do #Show
          render("notes/show", note: Note.find(:id => id))
        end

        on "edit" do #Edit
          render("notes/edit", note: Note.find(:id => id))
        end
      end
    end

    on post, authenticated(User) do
      on root do #Create
        begin
          note = Note.new do |n|
            n.title = req.POST["title"]
            n.description = req.POST["description"]
            n.date = Time.now
            if req.POST["img"]
              n.image = file_uploader(req.POST["img"])
            end
          end
          note.save
          res.redirect "/notes/#{note.id}", 302
        rescue Sequel::ValidationFailed
          session[:error] = "Title and description are not optionals."
          res.redirect "/notes/new"
        end
      end
    end

    on put, authenticated(User) do
      on ":id", param("title"), param("description") do |id, tit, desc| #Update
        note = Note.find(:id => id)
        if req.POST["img"]
          filename = file_uploader(req.POST["img"])
          note.update(title: tit, description: desc, image: filename)
        else
          note.update(title: tit, description: desc)
        end
        res.redirect "/notes/#{note.id}", 302
      end
    end

    on delete, authenticated(User) do #Destroy
      on ":id" do |id|
        Note.find(:id => id).destroy
        res.redirect("/notes")
      end
    end

  end
end
