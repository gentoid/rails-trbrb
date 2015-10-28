require 'rails_helper'
require 'cells'
require 'capybara/rspec'

describe Thing::Cell, type: :cell do
  let (:rails) { Thing::Create.( thing: { name: 'Rails' } ).model }
  let (:trb) { Thing::Create.( thing: { name: 'Trailblazer' } ).model }

  subject { concept 'thing/cell', collection: [rails, trb], last: trb }

  controller HomeController

  it 'renders things', type: :feature do
    expect(subject).to have_selector '.columns .header a', text: 'Rails'
    expect(subject).not_to have_selector '.columns.end .header a', text: 'Rails'
    expect(subject).to have_selector '.columns.end .header a', text: 'Trailblazer'
  end
end
