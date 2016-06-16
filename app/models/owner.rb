class Owner < ActiveRecord::Base
  valid_email=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :normalize_phone_number
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: valid_email}


  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
  	if phone.present?
      phone.gsub!(/[^x' '0-9]/, '')
      if phone[0] == "1"
        phone[0] = ''
      end
    end
  end

end
