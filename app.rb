require "cuba"
require "cuba/render"
require "cuba/safe"
require "mote"
require "mote/render"
require "rack/protection"
require "sequel"
require "mysql"

Cuba.plugin(Cuba::Render)
Cuba.plugin(Mote::Render)
Cuba.plugin(Cuba::Safe)


Cuba.use(Rack::Session::Cookie, :secret => "!@(!P{($)})")
Cuba.use(Rack::Protection)
Cuba.use (Rack::MethodOverride)

Dir["./config/*.rb"].each {|f| require(f) }
Dir["./routes/*.rb"].each { |f| require(f) }
Dir["./models/*.rb"].each { |f| require(f) }

Cuba.define do
  on root do
    render("home")
  end

  on "notes" do
    run(Notes)
  end
end
