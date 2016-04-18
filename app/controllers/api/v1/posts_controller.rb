class Api::V1::PostsController < Api::V1::BaseController

  # GET /posts e.g.
  # curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/v1/posts
  def index
    @posts = Post.all
    render(json: ActiveModel::ArraySerializer.new(@posts, each_serializer: Api::V1::PostsSerializer, root: 'posts'))
  end

  # GET /posts/1 e.g.
  # curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/v1/posts/1
  def show
    @post = Post.find(params[:id])
    render(json: Api::V1::PostsSerializer.new(@post).to_json)
  end

  # POST /posts e.g.
  # curl -H "Content-Type: application/json" -X POST -d '{"post":{"title":"xyz","body":"xyz"}}' http://localhost:3000/api/v1/posts
  def create
    @post = Post.new(create_params)
    return api_error(status: 422, errors: @post.errors) unless @post.valid?
    @post.save!
    #@post.activate
    render(json: Api::V1::PostsSerializer.new(@post).to_json, status: 201, location: api_v1_post_path(@post.id))
  end

  # PATCH/PUT /posts/1
  # curl -H "Content-Type: application/json" -X PATCH -d '{"post":{"id":"3","title":"xyz","body":"xyz"}}' http://localhost:3000/api/v1/posts/1
  def update
    @post = Post.find(params[:id])
    if !@post.update_attributes(update_params)
      return api_error(status: 422, errors: @post.errors)
    end
    render(json: Api::V1::PostsSerializer.new(@post).to_json, status: 200, location: api_v1_post_path(@post.id))
  end

  # DELETE /posts/1 e.g.
  # curl -i -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/v1/posts/1
  def destroy
    @post = Post.find(params[:id])
    if !@post.destroy
      return api_error(status: 500)
    end
    head status: 204
  end

  private

  def create_params
    params.require(:post).permit(:title, :body).delete_if{ |k,v| v.nil?}
  end
  def update_params
    create_params
  end

end
