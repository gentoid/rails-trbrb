require 'rails_helper'

describe Comment::Create do
  let (:thing) { Thing::Create.( thing: { name: 'Ruby' } ).model }

  it 'persists valid' do
    res, op = Comment::Create.run(
      comment: {
        body: 'Fantastic!',
        weight: '1',
        user: { email: 'john@example.com' }
      },
      thing_id: thing.id,
    )
    comment = op.model

    expect(comment.persisted?).to eq true
    expect(comment.body).to eq 'Fantastic!'
    expect(comment.weight).to eq 1

    expect(comment.user.persisted?).to eq true
    expect(comment.user.email).to eq 'john@example.com'

    expect(op.thing).to eq thing
  end

  it 'invalid email' do
    res, op = Comment::Create.run comment: { user: { email: '1337@' } }

    expect(res).to eq false
    expect(op.errors.messages[:'user.email']).to eq ['is invalid']
  end

end
