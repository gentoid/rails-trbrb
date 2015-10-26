require 'rails_helper'
require 'cells'

describe Thing::Cell do
  let (:rails) { Thing::Create.( thing: { name: 'Rails' } ) }
  let (:trb) { Thing::Create.( thing: { name: 'Trailblazer' } ) }

  subject { concept 'thing/cell', collection: [trb, rails], last: rails }

  it 'renders things' do
    expect(subject).to have_selector '.columns'
  end
end
