class Category < ApplicationRecord
    has_many :articles
  end
   
  class Article < ApplicationRecord
    belongs_to :category
    has_many :comments
    has_many :tags

    scope :has_article, -> { where.not(:article => nil)}
    scope :created_before, -> (time){ where('created_at < ?', time) }    
    # default_scope { where(article: 'max') }

    def self.updated_before(time)
      return where('updated_at < ?', time) if time.present?
      Article.none
    end

    # enum name: [:available, :unavailable]
    enum article: [:available, :unavailable]

    # after_touch do |art|
    #   art.article = "akkkubu"
    #   art.save
    # end
  end
   
  class Comment < ApplicationRecord
    belongs_to :article
    has_one :guest
  end
   
  class Guest < ApplicationRecord
    belongs_to :comment
    def self.has_guest
      where.not(:guest => nil)
    end

    scope :guest_and_update, -> { has_guest.where.not(updated_at: nil) }
  end
   
  class Tag < ApplicationRecord
    belongs_to :article
  end