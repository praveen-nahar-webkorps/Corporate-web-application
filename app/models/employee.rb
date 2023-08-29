class Employee < ApplicationRecord
    
    has_many :documents
    
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :city, :state, :pincode, presence: true

    def full_name    #this method define inside view>employees>index
        "#{first_name}  #{last_name}".strip
    end

    def full_address
        "#{city}, #{state}, #{pincode}".strip
    end
end


