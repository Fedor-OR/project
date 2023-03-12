require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
let(:user) { create(:user) }

let(:post) { create(:post) }

before { sign_in user }

describe "#create" do

  subject { process :create, method: :post, params: params }

  let!(:post) { create :post, user: user }
  let(:params) do
    {
      comment: attributes_for(:comment),
      post_id: post
    }
  end

  it 'create comment' do 

    expect{ subject }.to change(Comment, :count).by(1)

  end

  it "отображение сохраненного коментария" do

    is_expected.to redirect_to post_path(post)
    # expect(response).to redirect_to post_path(post)

  end

  
end












end