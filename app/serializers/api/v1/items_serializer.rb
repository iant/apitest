class Api::V1::ItemsSerializer < Api::V1::BaseSerializer
  attributes :id, :title, :body #, :desc
  has_one :description
  has_many :comments

  #def desc
  #  DescriptionsSerializer.new(object.description).attributes
  #end


end
