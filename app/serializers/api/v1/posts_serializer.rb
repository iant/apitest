class Api::V1::PostsSerializer < Api::V1::BaseSerializer

	#ActiveModel::Serializer
  attributes :id, :title, :body
end
