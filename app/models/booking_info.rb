class BookingInfo < ApplicationRecord 
  belongs_to :user 
  belongs_to :theater 
  belongs_to :screen 
  belongs_to :show

  validate :check_remaining_tickets
 
  private

  def check_remaining_tickets
    show_time = show.show_times.find_by(time: booking_time)

    if show_time.nil?
      errors.add(:base, "Invalid show time")
      return
    end

    if show_time.remaining_seats.zero?
      errors.add(:base, "No more tickets available for this show.")
    elsif no_of_tickets.to_i > show_time.remaining_seats
      errors.add(:no_of_tickets, "Only #{show_time.remaining_seats} tickets remaining for this show.") 
    end
  end
end

