class Author < ApplicationRecord
  # has_many :books, dependent: :destroy
  has_many :books
  # has_many :books, dependent: :destroy, inverse_of: 'writer'
  # has_many :books do
  #   def find_by_book_prefix(id)
  #     find_by(id: id)
  #   end
  # end
  # accepts_nested_attributes_for :books
  accepts_nested_attributes_for :books, allow_destroy: true, 
    reject_if: lambda {|attributes| puts "attr: #{attributes}"; attributes.blank?}
end
