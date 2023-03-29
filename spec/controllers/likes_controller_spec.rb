require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }


  describe "#create" do

    subject { process :create, method: :post, params: params }

    let(:params)  { { post_id: post.id, user_id: user.id } }  
    let!(:post) { create :post, user: user } 


    it "создает лайк посту" do
      expect { subject }.to change(Like, :count).by(1)
    end

  end


  describe "#delete" do

      subject { process :destroy, method: :delete, params: params } 
  
      let!(:like) { create :like, post: post, user: user }
      # let(:params) { { id: { post_id: post.id, user_id: user.id } } }
      let!(:post) { create :post, user: user } 
      let(:params) { { post_id: post.id, id: like.id } }



      
    it "убрать лайк" do
      expect { subject }.to change(Like, :count).by(-1)
    end

  end

end