require "prawn"
class LoginsController < ApplicationController
  # "Create" a login, aka "log the user in"
  before_action :require_login, only: [:show]
  # skip_before_action :require_login, only: [:new, :create]

  # layout 'max'
  def download_pdf
    user = User.find(params[:id])
    send_data generate_pdf(user),
              filename: "#{user.name}.pdf",
              type: "application/pdf"
  end

  # def download_pdf
  #   user = User.find(params[:id])
  #   send_file("#{Rails.root}/app/files/users/#{user.id}.pdf",
  #             # filename: "#{user.name}.pdf",
  #             type: "application/pdf")
  # end

  def new
    @user = User.new
    # puts "@user: #{@user}"
    cookies[:name] = 'maaynk'
  end
  

  def create
    # binding.pry
    if params[:user][:name].present? and params[:user][:email].present? and user = User.where(name: params[:user][:name], email: params[:user][:email]).first
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      flash[:notice] = "You have successfully logged in."
      redirect_to login_path(user.id)
    else
      flash[:error] = "no user exits"
      redirect_to new_login_path
    end
  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    puts "You have successfully logged out."
    flash[:notice] = "You have successfully logged out."
    redirect_to logins_path
  end
  
  def show
    puts cookies[:name]
    unless @user = current_user
      @user = User.new(name: 'logout')
      flash.now[:error] = "no user exits" 
    else
      # download_pdf
      respond_to do |format|
        format.html
        format.pdf { render pdf: generate_pdf(@user), template: 'books/custom' }
      end  
    end
  end

  def index
    cookies.delete(:name)
    @users = User.all
    @user = current_user
    respond_to do |format|
      # binding.pry      
      format.html # index.html.erb
      # binding.pry
      format.xml  { render xml: @users } # add .xml to url
      format.json { render json: @users } # add .json to url
    end
    # stream
  end

  private 
    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_login_url # halts request cycle
      end
    end
       
    def generate_pdf(user)
      Prawn::Document.new do
        text user.name, align: :center
        text "name: #{user.name}"
        text "Email: #{user.email}"
      end.render
    end
end