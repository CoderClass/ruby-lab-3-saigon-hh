require 'rails_helper'

RSpec.feature "SortProducts", type: :feature do
  # get all links containing product names
  # http://www.rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Element
  def hat_links
    page.all(:css, "h4.product-name a").map(&:text)
  end

  scenario "visit clicks on Sort by Alphabetical" do
    product1 = FactoryGirl.create(:product, name: "Brad's Hat") # similar to Product.create, but with some default values
    # TODO: create another product with "Adam's Hat" name
    product1 = FactoryGirl.create(:product, name: "Adam's Hat") 

    visit root_path

    # verify the products are displayed in the order they were created:
    expect(hat_links).to eq ["Brad's Hat", "Adam's Hat"]

    # use Capybara's click_link to find a link with the exact text
    click_link "Sort by Alphabetical" # TODO: add this link in your view file to make this line pass


    # test that the current_url is exactly where the link should go
    expect(current_url).to eq root_url(sort: "alphabetical") # TODO: make sure your link submits to the correct URL

    expect(hat_links).to eq [ "Adam's Hat", "Brad's Hat"]
    # test that hat names are in the right order now
  end
end