class Document < ApplicationRecord
  has_many :sections
  # has_many :sections, -> { limit 2 }
  # has_many :sections, -> { group 'sections.name'}
  # has_many :sections, ->{ select 'id, document_id, count(id)' }
  # has_many :sections, ->{ offset(2) }
  # has_many :sections, ->{ distinct.select('name, id') }
  # has_many :sections, ->{ order('name desc').select('id,name, count(id)').group('sections.name').limit(2) }
  has_many :paragraphs, through: :sections
end
 
class Section < ApplicationRecord
  belongs_to :document
  has_many :paragraphs
end
 
class Paragraph < ApplicationRecord
  # belongs_to :section, -> { includes :document }
  belongs_to :section
  # belongs_to :section, -> { select "name" }
  # belongs_to :section, -> { readonly true }
  # belongs_to :section, -> { where "name = 'mayank'" }
end