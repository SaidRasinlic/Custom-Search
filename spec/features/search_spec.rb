require "rails_helper"

RSpec.describe "Search", type: :feature do
  before(:each) do
    @article = Article.create(title: "New test article", body: "New test article content")
    visit root_path
  end

  scenario "user can input search word" do
    expect(page).to have_selector("input")
  end

  scenario "user gets the results by searching the title" do
    page.driver.browser.post("/search",
                             search: "New",
                             identifier: 32_423_423)

    response = JSON.parse(page.driver.response.body)

    expect(page.driver.status_code).to eql(200)
    expect(response["data"][0]["content"]).eql?("New test article body")
  end

  scenario "user gets the results by searching the content" do
    page.driver.browser.post("/search",
                             search: "New",
                             identifier: 32_423_423)

    response = JSON.parse(page.driver.response.body)

    expect(page.driver.status_code).to eql(200)
    expect(response["data"][0]["content"]).eql?("New test article body")
  end

  scenario "user gets the error if 0 articles found" do
    page.driver.browser.post("/search",
                             search: "hello",
                             identifier: 32_423_423)

    response = JSON.parse(page.driver.response.body)

    expect(page.driver.status_code).to eql(404)
    expect(response["errors"].count).to eql(1)
  end
end
