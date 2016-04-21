class Api::V1::CommentsSerializer < Api::V1::BaseSerializer
  belongs_to :item
  attributes :body
end
