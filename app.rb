require "cuba"
require "cuba/render"
require "cuba/safe"
require "mote"
require "mote/render"
require "rack/protection"
require "ohm"

Cuba.plugin(Cuba::Render)
Cuba.plugin(Mote::Render)
Cuba.plugin(Cuba::Safe)

Cuba.use(Rack::Session::Cookie, :secret => "!@(!P{($)})")
Cuba.use(Rack::Protection)

Ohm.redis = Redic.new('redis://127.0.0.1:6379')

Dir["./controllers/*.rb"].each { |f| require(f) }
Dir["./models/*.rb"].each { |f| require(f) }

Cuba.define do
  on root do
    res.write("este es el home guachin")
  end

  on "notes" do
    run(Notes)
  end
end
