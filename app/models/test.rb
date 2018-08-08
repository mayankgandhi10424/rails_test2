class CustomException < Exception
end

class Test < ApplicationRecord
  # validates :part_number, presence: { strict: true }
  # validates :part_number, presence: { strict: false }, if: Proc.new { |a| puts a; true }
  validates :part_number, presence: { strict: false }, if: [Proc.new { true }, Proc.new { true }], unless: Proc.new { false } 

  has_many :products, inverse_of: :test
  validates_associated :products



  validates :part_number, exclusion: { in: %w(www us ca1 jp),
    message: "%{value} is reserved." }

  validates :part_number, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  # validates :size, inclusion: { in: %w(small medium large),
  #   message: "%{value} is not a valid size" }

  validates :size, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size", allow_nil: true }

  validates :part_number, length: { in: 1..5, too_long: "%{count} characters is the maximum allowed" }

end