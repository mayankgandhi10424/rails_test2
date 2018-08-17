# require_relative 'product'  
# require_relative 'table_formatter'  
load 'table_formatter.rb'  
# require 'hirb'
require_relative 'document'
require_relative 'category'

class Ruby
end

Hirb.enable

def prints(arr)
  TableFormatter.prints arr
end

# puts "\n---------------------------------- Find Each ----------------------------------\n\n"

# Product.find_each(start: 15, finish: 20, batch_size: 2) do |pr|
#   prints pr
# end

# puts "\n---------------------------------- Find In Batches ----------------------------------\n\n"
# Product.find_in_batches(start: 15, finish: 100, batch_size: 2) do |pr|
#   prints pr
# end

# puts "\n---------------------------------- Conditions ----------------------------------\n\n"
# #### not prefered ######
# a=12
# prints Product.where("test_int = 12")
# prints Product.where("test_int = #{a}")


# # ###### prefered ########
# prints Product.where("test_int = ? and price = ?", a, a)
# e_d = Time.now
# s_d = e_d - 3.day 
# prints Product.where("created_at >= :start_date AND created_at <= :end_date",
#  { start_date: s_d, end_date: e_d })

# puts "\n---------------------------------- Hash Conditions ----------------------------------\n\n"
# prints Product.where(price: 5.2)

# author = Author.first
# prints Author.joins(:books)
# prints Author.joins(:books).where(books: {author: author})

# prints Product.where(created_at: (Time.now.midnight - 11.day)..Time.now.midnight)

# prints Product.where(price: [1,2,5])

# prints Product.where.not(price: 5.2)

# prints Product.where(price: 12).or(Product.where(test_int: 12))

# prints Product.order(:price).order(test_int: :desc).where('id is not null')

# prints Product.all

# prints q = Product.select(:name).distinct
# prints q.distinct(false)

# prints q = Product.limit(5).offset(15)

# prints Product.select('date(created_at), sum(price) as tot_pr').group("date(created_at)").order('tot_pr')

# prints Product.group(:price).count

# prints Product.select('date(created_at), sum(price) as tot_pr').group("date(created_at)").having("sum(price) < ?", 100.1)


# puts "\n---------------------------------- Overriding Conditions ----------------------------------\n\n"

# prints Product.where('id > 10').limit(20).order('id asc').unscope(:order)

# prints Product.where(id: 10, approved: false).unscope(where: :id)

# prints Product.order('id asc').merge(Product.unscope(:order))

# prints Product.order('id asc').merge(Product.unscope(:order))

# prints Product.where('id > 10').limit(20).order('id desc').only(:order, :where)

# prints Product.where('id > 10').limit(20).order('id desc').reorder(:name)

# prints Product.where('id > 10').order('name').reverse_order

# prints Product.where('id > 10').reverse_order

# prints Product.where('id > 10').rewhere('id < 11' )

# prints Product.where(id: 10).rewhere(id: 11 )

# prints Product.none

# puts "\n---------------------------------- Locking Records for Update ----------------------------------\n\n"

# p1 = Product.find(1)
# p2 = Product.find(1)

# p1.test_int = 18
# p1.save
# puts p1.errors.messages

# p2.name = "mayank"
# p2.save
# puts p2.errors.messages

# t1 = Thread.new do 
#   Product.transaction do
#     puts "Thread 1"
#     i = Product.lock.first
#     sleep(5)
#     i.name = 'Jones'
#     i.save!
#     puts "Thread 1 end"
#   end
# end
# t2 = Thread.new do
#   Product.transaction do
#     puts "Thread 2"
#     i = Product.lock.first
#     #sleep(5)
#     i.name = 'Jones'
#     i.save!
#     puts "Thread 2 end"
#   end
# end

# t1.join
# t2.join

# puts "\n---------------------------------- Joining Tables ----------------------------------\n\n"

# prints Author.joins("inner join books on books.author_id = authors.id").select("books.*, authors.*")

# prints Author.joins(:books)

# prints Document.joins(:sections, :paragraphs).select('*')

# prints Section.joins(:document, :paragraphs).select('*')

# prints Document.joins(sections: :paragraphs).select('*')

# prints Category.joins(articles: {comments: :guest}).select('*')

# prints Category.joins(articles: [{ comments: :guest }, :tags]).select('*')

# prints Category.left_outer_joins(articles: [{ comments: :guest }, :tags]).select('categories.id as cid,articles.id as aid,guests.*')

#---------------------------------------------------------------------------------------
# ----------------------------------- The Ultimate Query -------------------------------
#---------------------------------------------------------------------------------------

# (Category.create(category: 'ruby').articles.push(Article.create(article: 'sahi hai kya')).
# first.comments.push(Comment.create(comment: 'han hai')).first.guest = 
# Guest.create(guest: 'jaspreet')).comment.article.tags.push(Tag.create(tag: 'mast'))

# puts "\n------------------------ Eager Loading Associations ----------------------------------\n\n"

# c = Category.all

# c.each do |ca|
#   ca.articles.each do |ar|
#     puts ar.article
#   end
# end

# c = Category.includes(:articles).all

# c.each do |ca|
#   ca.articles.each do |ar|
#     puts ar.article
#   end
# end

# prints Category.includes(articles: { comments: :guest }).all

# prints Article.includes(:comments).where(comments: { comment: 'han hai' })

# #prints Article.includes(:comments).where("comments.comment= 'han hai'" )

# prints Article.includes(:comments).where("comments.comment= 'han hai'" ).references(:comments)

# puts "\n------------------------------- Scopes ----------------------------------\n\n"

# prints Article.has_article

# prints Guest.has_guest

# prints Guest.guest_and_update

# prints Category.first.articles.has_article

# prints Article.created_before(Time.now - 3.hour)

# prints Article.updated_before(Time.now - 2.5.hour)

# prints Article.new

# prints Article.unscoped.new

# prints Article.unscoped { Article.created_before(Time.now - 4.hour) }

# puts "\n---------------------------------- Enums ----------------------------------\n\n"

# prints a = Article.unscoped.new(article: :available)
# a.category = Category.last
# puts a.available?
# puts a.unavailable!
# puts a.available?

# puts "\n--------------------------- Find or Build a New Object ----------------------------------\n\n"

# prints Category.find_or_create_by(category: 'rails')
# prints Category.find_or_create_by(category: 'ramu')

# prints Category.create_with(types: 'max').find_or_create_by(category: 'jassi')
# prints Category.find_or_create_by(category: 'akki') do |c|
#   binding.pry
#   c.types = 'max'  
# end

# puts "\n--------------------------- Finding by SQL ----------------------------------\n\n"

# prints Category.find_by_sql('select * from authors')
# #prints Category.where('id = 2); select * from authors;(')
# prints Category.connection.select_all("SELECT category, created_at FROM categories")#.to_hash
# prints Category.pluck(:id)
# prints Category.pluck(:id, :category)
# prints Category.ids

# puts "\n--------------------------- Existence of Objects ----------------------------------\n\n"

# prints Category.exists?(1)
# prints Category.any?
# prints Category.many?
# prints Article.has_article.any?

# prints Category.count(:types)

# prints Category.joins(:articles).explain
