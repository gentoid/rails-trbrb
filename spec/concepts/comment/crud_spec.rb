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

    expect(comment.thing).to eq thing
  end
end
