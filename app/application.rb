class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/login/) && req.get?
      email = req.split("/").last
      user = User.find_by_email(email)

      return [200, { 'Content-Type' => 'application/json' }, [ user.to_json ]]

    elsif req.path == "/comics" && req.get?
      comic_to_json = Comic.all.to_json({include: 
        {reviews: 
          {include: :user}
        }
      })

      return [200, { 'Content-Type' => 'application/json' }, [ comic_to_json ]]
    
    elsif req.path == "/reviews" && req.get?
      review_to_json = Review.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ review_to_json ]]

    elsif req.path.match(/comics/) && req.get?
      id = req.path.split("/").last
      comic = Comic.find(id).to_json({include: 
        {reviews: 
          {include: :user}
        }
      })
      
      return [200, { 'Content-Type' => 'application/json' }, [ comic ]]

    elsif req.path.match("/reviews") && req.post?
      hash = JSON.parse(req.body.read)
      new_review = Review.create(hash)
      comic = Comic.find(new_review.comic.id).to_json({include: 
      {reviews: 
        {include: :user}
      }
    })
      
      return [201, { 'Content-Type' => 'application/json' }, [ comic ]]
    
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
