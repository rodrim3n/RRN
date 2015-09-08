class Notes < Cuba
  define do

    on get do
      on root do #Index
        render("notes/index", notes: Note.all)
      end

      on "new" do #New
        render("notes/new")
      end

      on ":id/edit" do |id| #Edit
        render("notes/edit", note: Note[id])
      end

      on ":id" do |id| #Show
        render("notes/show", note: Note[id])
      end
    end


    on post do
      on root do #Create
        note = Note.new do |n|
          n.title = req.POST["title"]
          n.description = req.POST["description"]
        end
        note.save
        res.redirect("/notes/#{note.id}", 302)
      end

      on ":id" do |id| #Update
        note = Note[id].update(
          title: req.POST["title"],
          description: req.POST["description"]
        )
        res.redirect("/notes/#{note.id}", 302)
      end
    end

    # on delete do #Destroy
      # on "delete/:id" do |id|
      #   note = Note[id].destroy
      #   res.redirect("/notes")
      # end
    # end


  end
end
