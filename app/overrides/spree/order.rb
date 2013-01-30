Spree::Order.class_eval do
  def associate_user!(user)
    self.user = user
    self.email = user.email

    temp_bill_address = self.bill_address
    temp_ship_address = self.ship_address
    self.ship_address = nil if temp_ship_address && temp_ship_address.invalid?
    self.bill_address = nil if temp_bill_address && temp_bill_address.invalid?

    save(validate: false)

    self.ship_address = temp_ship_address
    self.bill_address = temp_bill_address
  end
end
