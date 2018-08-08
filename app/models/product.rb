# class CustomValidator < ActiveModel::Validator
#   def validate(record)
#     # if record.name == 'soap'
#     #   record.errors[:base].push("ye jhagg deta hai")
#     # end
#     if options[:fields].any?{ |field| record.send(field) == "soap" }
#       record.errors[:base].push("ye jhagg deta hai")
#     end
#   end
# end

# class CustomValidator
#   def initialize(product)
#     @product = product
#   end
#   def validate
#     # some_complex_condition_involving_ivars_and_private_methods? 
#     if @product.name == 'soap'
#       @product.errors[:base] << "This product is evil"
#     end
#   end
# end

class EmailqValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Product < ApplicationRecord
  validates :description, acceptance: { accept: 'yes' }
  validates :part_number, acceptance: { accept: ['TRUE', 'accepted'] }
  belongs_to :test, optional: true
  validates :test, absence: true
  # validates :price, numericality: true
  validates :test_int, numericality: true#{ only_integer: true }
  # validates :price, absence: true

  # validates :test_int, uniqueness: true
  validates :test_int, uniqueness: { scope: :price, message: "test and price combination must be unique" }
  # validates :test_int, uniqueness: true, on: :account_setup
  
  # validates_with CustomValidator
  # validates_with CustomValidator, fields: [:test_int]
  
  validates :name, presence: true, emailq: true

  validate :test?

  # validate do |product|
  #   CustomValidator.new(product).validate
  # end

  # validates_each :name do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  # end

  def test?
    errors.add(:name, "can't be in the past", not_allowed: "!@#%*()_-+=")
    true
  end
end