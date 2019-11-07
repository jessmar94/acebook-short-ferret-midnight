module ControllerMacros

  def controller_login_user
    factoryboi
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def session_login_user
    factorygrill
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  def factoryboi
    FactoryBot.define do
      factory :user do
        email { "test@test.com" }
        username { 'Jay' }
        password { "password" }
        password_confirmation { "password" }
      end
    end
  end

  def factorygrill
    FactoryBot.define do
      factory :user2 do
        email { "test2@test.com" }
        username { 'Jay2' }
        password { "password2" }
        password_confirmation { "password2" }
      end
    end
  end

end
