require 'rails_helper'
require_relative '../../../app/concepts/thing/crud'

describe Thing::Create do
  let(:thing) { Thing::Create.(thing: { name: 'Rails', description: 'Web dev' }).model }

  it 'persists valid' do
    expect(thing.persisted?).to eq true
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Web dev'
  end
end
