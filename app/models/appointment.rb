class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
  # after_destroy :destroy_may
  # private
  #   def destroy_may
  #     binding.pry
  #     puts "Appointment destroyed"
  #   end
end
