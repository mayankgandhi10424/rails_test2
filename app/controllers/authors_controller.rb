class AuthorsController < ApplicationController
  layout "max"
  Rails.application.config.session_store :cookie_store, key: '_your_app_session'
  def index
    @status = params[:status]
    @id = params[:ids]
  end

  def new
    # @author = Author.first
    # @book = @author.books.last
    # @book = @author.books.build
    @author = Author.last.books.create(published_at: Time.now).author
    # @author = Author.create(name: 'max').books.create(published_at: Time.now).author
    # @author = Author.new
    # 2.times { @author.books.build }
    render 'test'
  end

  def create
    @author = Author.new(author_params)
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    render 'test'
  end
 
  private
    def author_params
      params.require(:author).permit(:name, books_attributes: [:id, :author_id, :_destroy])
    end
  
end