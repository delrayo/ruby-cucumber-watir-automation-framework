require 'watir'
require 'page-object'
require 'page-object/page_factory'
require 'dotenv'
require 'pry'
Dotenv.load('../../.env') # loads environment variables from .env file

World(PageObject::PageFactory)

Before do
  @browser = Watir::Browser.new
end

After do |scenario|
  begin
    if scenario.failed?
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  ensure
    @browser.close
  end
end