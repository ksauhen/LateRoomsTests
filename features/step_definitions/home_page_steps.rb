When(/^I search for a room to stay$/) do |table|
  HomePage.new.search_for(table)
end

Given(/^Late Rooms home page is opened$/) do
  HomePage.new.load
end