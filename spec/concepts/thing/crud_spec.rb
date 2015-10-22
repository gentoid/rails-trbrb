require 'rails_helper'
require_relative '../../../app/concepts/thing/crud'

describe Thing::Create do
  let(:thing) { Thing::Create.(thing: { name: 'Rails', description: 'Web dev' }).model }

  it 'persists valid' do
    expect(thing.persisted?).to eq true
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Web dev'
  end

  it 'fails validation' do
    res, op = Thing::Create.run thing: { name: '' }

    expect(res).to eq false
    expect(op.model.persisted?).to eq false
    expect(op.contract.errors.to_s).to eq '{:name=>["can\'t be blank"]}'
  end

end
