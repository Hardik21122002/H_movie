class ShowTime < ApplicationRecord 
  belongs_to :show    
  validates :time, presence: true  
  before_save :update_remaining_seats 
   
  private 
  
  def update_remaining_seats
    if total_seats_changed?
      self.remaining_seats = total_seats
    end
  end 
end


