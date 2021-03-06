require 'rails_helper'

RSpec.feature "AddToCart", type: :feature, js: true do


  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        # open_asset available in support/images.rb
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "They see cart count change to 1" do
    # ACT
    visit root_path

    # pp page.html
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (0)'
    first('button.btn-primary').click
    save_screenshot
    expect(page).to have_content 'My Cart (1)'
  end

end
