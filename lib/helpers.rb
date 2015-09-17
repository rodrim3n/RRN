module Helpers
  def current_user
    authenticated(User)
  end

  def is_admin?
    current_user[:admin]
  end

  def notfound(msg)
    res.status = 404
    res.write(msg)
    halt(res.finish)
  end

  def forbidden(msg)
    res.status = 403
    res.write(msg)
    halt(res.finish)
  end

  def file_uploader(file)
    tempfile = file[:tempfile]
    filename = SecureRandom.hex(10) + file[:filename]
    File.open("./public/img/#{filename}", 'wb') do |f|
      f.write(tempfile.read)
    end
    filename
  end

end
