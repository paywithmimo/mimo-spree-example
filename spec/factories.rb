FactoryGirl.define do
  factory :mimo_payment_method, :class => Spree::Gateway::Mimo do
    name 'MiMo'
    environment 'test'
  end
end
