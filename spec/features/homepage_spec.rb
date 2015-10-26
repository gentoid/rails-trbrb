require 'rails_helper'

feature 'Homepage' do
  scenario 'contains things' do
    Thing::Create.( thing: { name: 'Trailblazer' } )
    Thing::Create.( thing: { name: 'Rails' } )

    visit '/'

    expect(page.body).to have_selector '.columns .header a', 'Rails'
    expect(page.body).to have_selector '.columns.end', 1
    expect(page.body).to have_selector '.columns.end .header a', 'Trailblazer'

  end
end
