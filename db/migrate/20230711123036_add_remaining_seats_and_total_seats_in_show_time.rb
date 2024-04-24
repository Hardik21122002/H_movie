class AddRemainingSeatsAndTotalSeatsInShowTime < ActiveRecord::Migration[6.0]
  def change 
    add_column  :show_times,:total_seats, :integer
    add_column  :show_times,:remaining_seats, :integer 
  end
end
