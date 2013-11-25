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
    check "AC"
    check "NNW"
    click_on 'Create policy'
    page.should have_content 'Polisa zapisana'
    policy = Policy.last
    policy.number.should == '1234'
    policy.collection.should == 250
    policy.products.count.should == 2
  end

end
