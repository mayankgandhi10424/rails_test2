class Book < ApplicationRecord
  # belongs_to :writer, class_name: 'Author', foreign_key: 'author_id' 
  # belongs_to :author
  # belongs_to :author, dependent: :destroy
  # belongs_to :author, counter_cache: true
  belongs_to :author, autosave: true
end