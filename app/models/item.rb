class Item < ActiveRecord::Base
  has_many :comments
  has_one :description
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :description


end
