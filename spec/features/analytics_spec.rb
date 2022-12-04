require "rails_helper"

RSpec.describe "Analitycs", type: :feature do
  before(:each) do
    @article = Article.create(title: "New test article", body: "New test article content")
    page.driver.browser.post("/search",
                             search: "new",
                             identifier: 32_423_423)
    page.driver.browser.post("/search",
                             search: "hello",
                             identifier: 324_234_223)
  end

  it "user can see number of searches" do
    visit analytics_path
    section = page.find(".total-searches")

    expect(section).to have_content("2")
  end

  it "user can see number of articles" do
    visit analytics_path
    section = page.find(".number-of-articles")

    expect(section).to have_content("1")
  end

  it "user can see number of successfull searches" do
    visit analytics_path
    section = page.find(".successful-searches")

    expect(section).to have_content("1")
  end

  it "user can see number of unsuccessfull searches" do
    visit analytics_path
    section = page.find(".unsuccesfull-searches")

    expect(section).to have_content("1")
  end

  it "user can see successfull searches" do
    visit analytics_path
    expect(page).to have_content("new")
  end

  it "user can see unsuccessfull searches" do
    visit analytics_path
    expect(page).to have_content("hello")
  end
end
