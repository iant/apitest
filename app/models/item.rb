class Item < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_one :description, dependent: :destroy
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :description


end
