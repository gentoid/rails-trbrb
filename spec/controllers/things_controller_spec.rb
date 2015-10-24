require 'capybara/rspec'

describe ThingsController do
  describe '#create' do
    it 'creates and redirects if thing valid' do
      post :create, thing: { name: 'All is ok' }
      
      expect(response).to redirect_to thing_path Thing.last
    end

    it 'shows error message if thing invalid', type: :request do
      post '/things', thing: { name: '' }
      p response.body
      #:follow_redirect!
#      p page.methods, page.body, page.html, page.status_code
      p response.body
      expect(response.body).to have_selector '.error'
    end
  end
end
