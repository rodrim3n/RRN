class User < Sequel::Model
  include Shield::Model
  plugin :validation_helpers

  def validate
    super
    validates_unique :username
    validates_presence [:username, :crypted_password]
  end

  def self.fetch(username)
    self.find(:username => username)
  end
end
