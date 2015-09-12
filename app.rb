require "cuba/render"
require "cuba/safe"

Cuba.plugin(Cuba::Render)
Cuba.plugin(Mote::Render)
Cuba.plugin(Cuba::Safe)

Cuba.use(Shield::Middleware,"/login")
Cuba.plugin(Shield::Helpers)

Cuba.use(Rack::Session::Cookie, :secret => "!@(!P{($)})")
Cuba.use(Rack::Protection)
Cuba.use(Rack::MethodOverride)

Dir["./config/*.rb"].each {|f| require(f) }
Dir["./routes/*.rb"].each { |f| require(f) }
Dir["./models/*.rb"].each { |f| require(f) }

Cuba.define do
  on csrf.unsafe? do
    csrf.reset!
    res.status = 403
    res.write "Not authorized"
    halt(res.finish)
  end

  on root do
    render("home")
  end

  on "notes" do
    run(Notes)
  end

  on "admin", authenticated(User) do
    run(Admins)
  end

  on "login" do
    render("login")
  end

  on post, "login", param("username"), param("password") do |u, p|
    if login(User, u, p)
      session[:success] = "You have successfully logged in."
      res.redirect "admin", 302
    else
      session[:error] = "Invalid username and/or password combination."
      render("login")# msg: session[:error])
    end
  end

  on default do
    res.write "Page not found.", 404
  end
end
