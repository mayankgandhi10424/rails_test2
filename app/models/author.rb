class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  # has_many :books, dependent: :destroy, inverse_of: 'writer'
  # has_many :books do
  #   def find_by_book_prefix(id)
  #     find_by(id: id)
  #   end
  # end
end
