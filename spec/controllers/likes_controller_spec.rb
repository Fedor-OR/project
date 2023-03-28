require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }


  describe "#create" do

    subject { process :create, method: :post, params: params }

    let(:params)  { { like: { post_id: post.id, user_id: user.id } } } 
    let!(:post) { create :post, user: user } 


    it "создает лайк посту" do
      expect { subject }.to change(Like, :count).by(1)
    end

  end

    # it "отображенеи количества лайков" do
    # subject
    # expect(assigns(:likes)).to eq(likes)
    # expect(assigns(:products).count).to eq 1
    # expect(assigns(:products).count).to be_positive

    # end



    # it "убрать лайк" do
    
    # end


end