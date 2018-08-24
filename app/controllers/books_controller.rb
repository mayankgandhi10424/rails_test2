class BooksController < ApplicationController
  # protect_from_forgery except: :index
  layout "max"
  def index
    @books = Book.all
    @author = Author.first
    @authors = Author.all
    @kuchbhi = Author.first
    # render inline: "xml.p {'Horrid coding practice!'}", type: :builder
    # render inline: "<% @books.each do |p| %><p><%= p.author.books_count %></p><% end %>"
    # render html: helpers.tag.strong('Not Found')
    # render html: "<p>html</p>"
    # render json: @books
    # render xml: @books
    # render js: "alert('Hello Rails')";
    # render body: "<p>raw</p>"
    # render layout: "max"
    # photo = 'images/test.jpg'
    # render xml: photo, location: photo_url(photo)
    # render status: 500
    # render status: :forbidden    
    # render 'custom'
    # render 'show'
    render 'test'
  end

  def show
    @book = Book.find(params[:id])
    # puts(@book.published_at)
    # render html: helpers.tag.strong('Not Found')
    # photos_path = 'https://4.img-dpreview.com/files/p/E~TS590x0~articles/3925134721/0266554465.jpeg' 
    # redirect_to photos_path
    # redirect_to 'images/test.jpg'
    # redirect_back(fallback_location: root_path)
    # redirect_to photos_path, status: 301
    # render action: "index"
    # redirect_to action: :index
    # @books = Book.all
    # flash.now[:alert] = "Your book was not found"
    # render "index"
    # head :bad_request
    # head :forbidden
    # head :created, location: book_path(Book.first)

  end

  def update
    @book = Book.find(params[:id])
    if @book.touch()
      redirect_to(@book)
    else
      render "edit"
    end
  end

  def edit
    @author = Author.first
  end
end
