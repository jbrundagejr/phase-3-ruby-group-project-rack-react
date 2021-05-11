class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    elsif req.path == "/comics" && req.get?
      comic_to_json = Comic.all.to_json({include: :reviews})
      return [200, { 'Content-Type' => 'application/json' }, [ comic_to_json ]]

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
