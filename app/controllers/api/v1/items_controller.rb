class Api::V1::ItemsController < Api::V1::BaseController

  # GET /items e.g.
  # curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/v1/items
  def index
    @items = Item.all
    render(json: ActiveModel::ArraySerializer.new(@items, each_serializer: Api::V1::ItemsSerializer, root: 'items' ))
  end

  # GET /items/1 e.g.
  # curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/v1/items/1
  def show
    @item = Item.find(params[:id])
    render(json: Api::V1::ItemsSerializer.new(@item).to_json)
  end

  # item /items e.g.
  # curl -H "Content-Type: application/json" -X POST item -d '{"item":{"title":"xyz","body":"xyz", "description_attributes":{"body":"description body text"}, "comments_attributes":[{"body":"comments body text"}]}}' http://localhost:3006/api/v1/items
  def create
    puts create_params
    @item = Item.new(create_params)
    return api_error(status: 422, errors: @item.errors) unless @item.valid?
    @item.save!
    #@item.activate
    render(json: Api::V1::ItemsSerializer.new(@item).to_json, status: 201, location: api_v1_item_path(@item.id))
  end

  # PATCH/PUT /items/1
  # curl -H "Content-Type: application/json" -X PATCH -d '{"item":{"id":"3","title":"xyz","body":"xyz"}}' http://localhost:3000/api/v1/items/1
  def update
    @item = Item.find(params[:id])
    if !@item.update_attributes(update_params)
      return api_error(status: 422, errors: @item.errors)
    end
    render(json: Api::V1::ItemsSerializer.new(@item).to_json, status: 200, location: api_v1_item_path(@item.id))
  end

  # DELETE /items/1 e.g.
  # curl -i -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/v1/items/1
  def destroy
    @item = Item.find(params[:id])
    if !@item.destroy
      return api_error(status: 500)
    end
    head status: 204
  end

  private

  def create_params
    params.require(:item).permit(:title, :body, description_attributes:[:body], comments_attributes:[:body]).delete_if{ |k,v| v.nil?}
  end
  def update_params
    create_params
  end

end
