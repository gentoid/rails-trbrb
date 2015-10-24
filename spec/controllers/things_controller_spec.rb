require 'capybara/rspec'

describe ThingsController do
  describe '#create' do
    it 'creates and redirects if thing valid' do
      post :create, thing: { name: 'All is ok' }
      
      expect(response).to redirect_to thing_path Thing.last
    end

    it 'renders "new" form again if thing invalid', type: :controller do
      post :create, thing: { name: '' }
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    render_views

    let (:thing) { Thing::Create.(thing: { name: 'Rails', description: 'Web dev' }).model }

    it 'shows name field as disabled', type: :request do
      get "/things/#{thing.id}/edit", id: thing.id
      expect(response).to render_template :new
      expect(response.body).to include 'Name'
    end
  end
end
