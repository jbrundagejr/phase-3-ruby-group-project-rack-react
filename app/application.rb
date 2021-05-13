class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/login/) && req.get?    #Login
      email = req.path.split("/").last
      user = User.find_by_email(email)

      return [200, { 'Content-Type' => 'application/json' }, [ user.to_json ]]

    elsif req.path.match("/sign_up") && req.post?   #Sign up
      hash = JSON.parse(req.body.read)
      new_user = User.create(hash).to_json
      
      return [201, { 'Content-Type' => 'application/json' }, [ new_user ]]

    elsif req.path == "/comics" && req.get?   # Get all comics
      comic_to_json = Comic.all.to_json({include: 
        {reviews: 
          {include: :user}
        }, methods: [:rating_average]
      })

      return [200, { 'Content-Type' => 'application/json' }, [ comic_to_json ]]
    
    elsif req.path == "/reviews" && req.get?    # get all reviews
      review_to_json = Review.all.to_json

      return [200, { 'Content-Type' => 'application/json' }, [ review_to_json ]]

    elsif req.path.match(/comics/) && req.get?    # Find comic by ID (for review adding)
      id = req.path.split("/").last
      comic = Comic.find(id).to_json({include: 
        {reviews: 
          {include: :user}
        }, methods: [:rating_average]
      })
      
      return [200, { 'Content-Type' => 'application/json' }, [ comic ]]

    elsif req.path.match("/reviews") && req.post?   # Post new review
      hash = JSON.parse(req.body.read)
      new_review = Review.create(hash)
      comic = Comic.find(new_review.comic.id).to_json({include: 
        {reviews: 
          {include: :user}
        }
      })
      
      return [201, { 'Content-Type' => 'application/json' }, [ comic ]]

    elsif req.path.match("/groups") && req.get?   # Get all groups
      group_to_json = Group.all.to_json({
        include: {
          posts: {
            include: :user}
          }
        })

      return [200, { 'Content-Type' => 'application/json' }, [ group_to_json ]]
    
    elsif req.path.match("/groups") && req.post?    # Create new group
      hash = JSON.parse(req.body.read)
      new_group = Group.create(hash).to_json({include: :posts})

      return [201, { 'Content-Type' => 'application/json' }, [ new_group ]]
    

    elsif req.path.match("/posts") && req.post?   # New post
      hash = JSON.parse(req.body.read)
      new_post = Post.create(hash).to_json({
        include: :user
      })
      
      return [201, { 'Content-Type' => 'application/json' }, [ new_post ]]

    elsif req.path.match("/posts/") && req.get?   # Getting related to a specified group
      id = req.path.split("/").last
      posts = Group.find(id).posts.to_json({
        include: :user
      })

      return [200, { 'Content-Type' => 'application/json' }, [ posts ]]

    elsif req.path.match("/comics") && req.post?  # Create new comic
      hash = JSON.parse(req.body.read)
      new_comic = Comic.create(hash).to_json({include: 
        {reviews: 
          {include: :user}
        }
      })
      
      return [201, { 'Content-Type' => 'application/json' }, [ new_comic ]]
    
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
