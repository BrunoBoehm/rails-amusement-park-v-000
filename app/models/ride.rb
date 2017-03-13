class Ride < ActiveRecord::Base
	
  belongs_to :user
  belongs_to :attraction

  def take_ride
    short_tickets = (user.tickets < attraction.tickets)
    short_height = (user.height < attraction.min_height)

    if !short_tickets && !short_height
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      msg = "Thanks for riding the #{attraction.name}!"
    else
      msg = "Sorry."
      msg += " You do not have enough tickets to ride the #{attraction.name}." if short_tickets
      msg += " You are not tall enough to ride the #{attraction.name}." if short_height
      msg
    end
  end
end