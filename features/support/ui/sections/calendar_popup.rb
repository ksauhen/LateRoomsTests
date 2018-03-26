require 'chronic'
class CalendarPopup < SitePrism::Section

  element :next_month, '.next.available'
  element :left_calendar, '.calendar.left'
  element :left_calendar_month, '.calendar.left .month'
  element :confirm_button, '.applyBtn'


  def set(checkin, checkout)

    checkin = Chronic.parse(checkin)
    checkout = Chronic.parse(checkout)

    set_date(checkin)
    set_date(checkout)

    confirm_button.click

  end

  def set_date(date)

    month_year = date.strftime('%b %Y')

    while left_calendar_month.text != month_year
      next_month.click
    end

    left_calendar.find(:xpath, ".//tbody//td[text()='#{date.strftime('%-d')}']").click

  end

end