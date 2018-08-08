class UserCallbacks
  def self.after_validation(user)
    binding.pry
    # raise
  end

  def self.before_validation(user)
    binding.pry
  end
  
  def self.before_save(user)
    binding.pry
  end
  
  def self.around_save(user)
    # binding.pry
    puts "around save"
  end
  
  def self.before_create(user)
    binding.pry
  end
  
  def self.around_create(user)
    binding.pry
  end
  
  def self.after_create(user)
    binding.pry
  end
  
  def self.after_save(user)
    binding.pry
    puts "saved"
  end
  
  def self.after_commit(user)
    puts "transaction commited"
  end
end

class User < ApplicationRecord
  # validates :login, :email, :name, presence: true

  # after_validation :set_location, on: [:create, :update]

  # before_save UserCallbacks

  # # around_save UserCallbacks

  # before_create UserCallbacks

  # around_create UserCallbacks

  after_create UserCallbacks

  after_save UserCallbacks

  after_commit UserCallbacks

  after_validation UserCallbacks

  before_validation UserCallbacks

  # before_validation :ensure_login

  before_validation do 
    # binding.pry
    self.name = login.capitalize if (name.blank? and login.present?)
  end

  before_validation :normalize_name, on: :create

  private
    def ensure_login
      # binding.pry
      if login.nil?
        self.login = email unless email.blank?
      end
    end

    def normalize_name
      # binding.pry
      self.name = name.downcase.titleize unless name.blank?
    end

    def set_location
      # binding.pry
      self.location = :indore
    end
end