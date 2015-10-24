require 'rails_helper'
require_relative '../../../app/concepts/thing/crud'

describe Thing::Create do
  let(:thing) { Thing::Create.(thing: { name: 'Rails', description: 'Web dev' }).model }

  it 'persists valid' do
    expect(thing.persisted?).to eq true
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Web dev'
  end

  it 'fails validation if length of name eql 0' do
    res, op = Thing::Create.run thing: { name: '' }

    expect(res).to eq false
    expect(op.model.persisted?).to eq false
    expect(op.contract.errors.to_s).to eq '{:name=>["can\'t be blank"]}'
  end

  it 'fails validation if length of description less than minimal value' do
    res, op = Thing::Create.run thing: { name: 'Rails', description: 'hi' }

    expect(res).to eq false
    expect(op.contract.errors.to_s).to eq '{:description=>["is too short (minimum is 4 characters)"]}'
  end

end

describe Thing::Update do
  let (:thing) { Thing::Create.(thing: { name: 'Rails', description: 'Web dev' }).model }

  it 'ignores name while persist valid thing' do
    Thing::Update.(id: thing.id, thing: { name: 'Lotus', description: 'Another dev' })

    thing.reload
    expect(thing.name).to eq 'Rails'
    expect(thing.description).to eq 'Another dev'
  end
end
