class Api::V1::ItemsSerializer < Api::V1::BaseSerializer
  attributes :id, :title, :body
  has_one :description
  has_many :comments
end
