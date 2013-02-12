require 'spec_helper'

describe "Checkout", js: true do
  let(:country) { create(:country, name: "Kangaland") }
  let!(:state) { create(:state, name: "Victoria", country: country) }
  let!(:payment_method) { create(:mimo_payment_method)}
  let!(:shipping_method) do
    shipping_method = build(:shipping_method)
    calculator = Spree::Calculator::PerItem.create!({calculable: shipping_method}, without_protection: true)
    shipping_method.calculator = calculator
    shipping_method.save

    shipping_method
  end

  let!(:product) { create(:product) }

  it "redirects to mimo on third step" do
    url = '/content/cvv'
    Spree::Gateway::Mimo.any_instance.stub(:url).and_return(url) # url which is not used in checkout
    visit '/'
    click_on product.name
    click_on "Add To Cart"
    click_on "Checkout"
    click_on "Create a new account"
    fill_in :email, with: "test1@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Password Confirmation', with: "password"
    click_on "Create"
    address = "order_bill_address_attributes"
    fill_in "#{address}_firstname", with: "Ryan"
    fill_in "#{address}_lastname", with: "Bigg"
    fill_in "#{address}_address1", with: "143 Swan Street"
    fill_in "#{address}_city", with: "Richmond"
    select "Kangaland", from: "#{address}_country_id"
    select "Victoria", from: "#{address}_state_id"
    fill_in "#{address}_zipcode", with: "12345"
    fill_in "#{address}_phone", with: "(555) 5555-555"

    check "Use Billing Address"
    click_button "Save and Continue"
    click_button "Save and Continue"
    page.current_url.should end_with(url)
  end
end

