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
    render "home"
  end

  on "notes" do
    run Notes
  end

  on "admin" do
    run Admins
  end

  on "auth" do
    run Authentication
  end

  on default do
    res.status = 404
    res.write "404 - Page not found."
  end
end
