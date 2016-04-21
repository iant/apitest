class Api::V1::DescriptionsSerializer < Api::V1::BaseSerializer
  belongs_to :item 
  attributes :body
end
