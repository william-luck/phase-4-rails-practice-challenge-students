class Student < ApplicationRecord

    validates :name, presence: true
    validates :instructor_id, presence: true 

    belongs_to :instructor

end
