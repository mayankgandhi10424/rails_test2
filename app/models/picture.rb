class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Item < ApplicationRecord
  has_many :pictures, as: :imageable
end
