class Note < Sequel::Model
  plugin :validation_helpers
  def validate
    super
    validates_presence [:title, :description]
  end
end
