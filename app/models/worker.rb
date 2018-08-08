class Worker < ApplicationRecord
  has_many :subordinates, class_name: "Worker", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Worker"
end
