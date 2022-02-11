require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Test1" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_1" do
    @driver.get "http://localhost:3000/index/input"
    @driver.find_element(:id, "n").clear
    @driver.find_element(:id, "n").send_keys "11"
    @driver.find_element(:id, "sequence").clear
    @driver.find_element(:id, "sequence").send_keys "2 4 16 3 4 16 25 64 64 78 10"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:xpath, "//table[@id='result_table']/tr[2]/td[2]").click
    @driver.find_element(:xpath, "//table[@id='result_table']/tr[3]/td[2]").click
    @driver.get "http://localhost:3000/index/input"
    @driver.find_element(:id, "n").clear
    @driver.find_element(:id, "n").send_keys "11"
    @driver.find_element(:id, "sequence").clear
    @driver.find_element(:id, "sequence").send_keys "2 4 16 3 4 16 25 64 64 78"
    @driver.find_element(:name, "commit").click
    (@driver.find_element(:id, "result_p").text).should == "Error. You did not complete the field. Or inconsistency in the amount of data"
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
