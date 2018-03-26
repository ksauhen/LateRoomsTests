When(/^I call autocomplete API for '(.*)'$/) do |search_for|
  @api_results = AutoCompleteApi.new.call_for(search_for)
end

Then(/^I will see the first result for '(.*)'$/) do |first|
  @text_captions = AutoCompleteApi.new.get_text_captions(@api_results)
  expect(@text_captions.first).to include(first)
end

Then(/^I will see the response matches schema$/) do
  result = JSON::Validator.fully_validate_json(File.read('features/support/api/schema/late_rooms_autocomplete.json'), @api_results)
  expect(result).to be_empty
end