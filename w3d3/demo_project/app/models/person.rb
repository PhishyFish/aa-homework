class Person < ApplicationRecord
  validates :name, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Home
end
