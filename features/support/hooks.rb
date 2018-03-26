Before('~@api') do


  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  Capybara.configure do |config|
    config.current_driver = :selenium
    config.javascript_driver = :selenium
  end

  Capybara.page.driver.browser.manage.window.maximize

end

After('~@api') do
  Capybara.page.driver.quit
end