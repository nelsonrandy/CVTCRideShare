class RequestController < ApplicationController
  
  #cannot be used due to a nonworking book method 
  def accept
    @request = Request.find_by_token(params[:token])  
    @ride    = Request.ride
    
    #mark the request as confirmed and update the database
    @request.confirmed = true
    @ride.seats_booked += 1
    @request.save
    @ride.save
    
  end
  
  def book
    #currently book does not work. fake it
    ride_id = params[:id] ? params[:id] : 7
    #send the email after creating the record
    if RideRequestMailer.ride_request(ride_id, current_user.id).deliver
      flash[:notice] = 'A ride request email has been to the driver, you will be notified when accepted.'
    else
      flash[:notice] = 'An internal error occured, unable to send confirmation email.'
    end
  end
  
end
