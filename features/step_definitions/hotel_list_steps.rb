Then(/^I will see some hotels in list$/) do
  expect(HotelListPage.new.get_number_of_hotels).to be > 0
end