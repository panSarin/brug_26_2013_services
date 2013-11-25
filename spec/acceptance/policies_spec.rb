# encoding: utf-8
require_relative 'acceptance_helper'
require 'spec_helper'

feature 'Policies',
'As a user,
In order to manage policies,
I want to ' do

  before :each do
    sign_in_as('basic')
  end

  scenario 'add new policy', js: true do
    visit new_policy_path
    fill_in 'Number', with: '1234'
    fill_in 'Client', with: 'Lorem client'
    check 'policy_product_ids_1'
    check 'policy_product_ids_3'
    check 'policy_product_ids_4'
    click_on 'Create policy'
    page.should have_content 'Polisa zapisana'
    Policy.first.number.should == '1234'
    Policy.first.collection.should == 550
  end

end
