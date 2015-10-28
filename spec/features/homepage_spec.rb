require 'rails_helper'

feature 'Homepage' do
  scenario 'contains things' do
    Thing::Create.( thing: { name: 'Rails' } )
    visit '/'
    expect(page.body).to have_selector '.header a', 'Rails'
  end
end
