require 'rails_helper'
require 'cells'
require 'capybara/rspec'

describe Thing::Cell::Grid, type: :cell do
  controller HomeController

  it 'renders grid of things', type: :feature do
    Thing::Create.( thing: { name: 'Trailblazer' } ).model
    Thing::Create.( thing: { name: 'Rails' } ).model

    html = concept('thing/cell/grid').show

    expect(html).to have_selector '.columns .header a', text: 'Rails'
    expect(html).not_to have_selector '.columns.end .header a', text: 'Rails'
    expect(html).to have_selector '.columns.end .header a', text: 'Trailblazer'
  end
end
