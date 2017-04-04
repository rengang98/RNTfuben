require 'rails_helper'

describe UsersController do

  context "signup" do


    it "chenggong" do
      post :create, params: {
          user: {email: '86554149@qq.com', password: 'rengang',
                 password_confirmation: 'rengang'}
      }
      expect(response).to redirect_to(new_session_path)
      end
      it "shibai" do
        post :create, params: {
            user: { email: '86554149@qq.com',password: 'rengang' }
        }
        expect(response).to render_template("new")
      end
    end
  end
