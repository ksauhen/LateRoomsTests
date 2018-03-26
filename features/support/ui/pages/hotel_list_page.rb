require_relative '../sections/hotel_list_item'

class HotelListPage < BasePage

  sections :hotel_list_items, HotelListItem, 'li.hotel'

  def get_number_of_hotels
    hotel_list_items.size
  end

end