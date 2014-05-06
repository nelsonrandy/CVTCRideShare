require 'test_helper'

class RequestHelperTest < ActionView::TestCase
  
  test "hide book button" do
    ride = Ride.find(1)
    user = ride.user
    assert_equal(ride.confirmed, true)
  end
end
