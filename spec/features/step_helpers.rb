require 'spec_helper'

def login_admin
  admin = create(:admin_user, email: "integrations@bitpay.com")
  visit spree.admin_login_path  
  fill_in 'Email', with: admin.email
  fill_in 'Password', with: 'secret'
  click_button "Login"    
  visit spree.new_admin_payment_method_path
end

def create_new_payment_method name, type
  fill_in "payment_method_name", with: name
  select type, from: "gtwy-type"
  click_on("Create")
end