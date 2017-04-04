require 'rails_helper'

describe UsersController do

  context "login" do


    it "chenggong" do
      post :create, params: {
          user: {email: '86554149@qq.com', password: '931108',
                 }
      }
      expect(response).to redirect_to(root_path)
      end
      it "shibai" do
        post :create, params: {
            user: { email: '86554149@qq.com',password: 'rengang' }
        }
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
