require_relative '../sections/calendar_popup'
class HomePage < BasePage

  element :location, '#destinationSearch'
  elements :location_autocomplete_items, '#autocomplete li'
  element :calendar_button, '.calendar-button'
  section :calendar_popup, CalendarPopup, '.datepicker-modal'
  elements :occupancy_options, '.occupancy__select option'
  element :search_button, '.search-button-wrapper button'

  set_url 'https://www.laterooms.com/'

  def search_for(table)

    searching_for = table.hashes[0]

    if searching_for.key?('location')
      location.click
      location.set searching_for['location']

      wait_until_location_autocomplete_items_visible(10)
      location_autocomplete_items[0].click
    end

    if searching_for.key?('checkin') || searching_for.key?('checkout')
      calendar_button.click
      calendar_popup.set searching_for['checkin'], searching_for['checkout']
    end

    if searching_for.key?('occupancy')
      occupancy_options.find{|o| o.text == searching_for['occupancy']}.click
    end

    search_button.click
  end

end