require 'rails_helper'

# TEST FAILING - NEEDS TO BE COMPLETED

RSpec.describe Users::SessionsController, type: :controller do

  describe 'POST #create' do
    pending
    before :each do
      @user = User.create(username: 'tan', email: 'tan@test.com', password: '1234567')
    end
    it 'welcomes user back with username' do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      session = post :create, params: { session: { email: @user.email, password: @user.password } }
      p session.created?
      # expect(flash[:notice]).to eq('Hello')
      # post :create, params: { session: { email: 'Hello, world!' } }
      # # p user.username
      # # expect(subject.welcome_message).to eq "Welcome back Tan"
      # # p response.welcome_message
      # # p @params
      #
      # # post :create, session: {login: 'john', password: 'pwd1234'}
      # p controller.current_user.id
      # expect(response).to redirect_to(posts_url)
      # expect(controller.current_user.id).to eq(user.id)

    end
  end
end
