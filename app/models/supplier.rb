class Supplier < ApplicationRecord
  has_one :account#, class_name: 'Billing::Account'
end