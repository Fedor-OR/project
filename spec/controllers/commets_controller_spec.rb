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


describe "#edit" do

subject { process :edit, method: :get, params: params }
let!(:comment) { create :comment, post: post, user: user }
let(:params) { { post_id: post.id, id: comment.id } }

it 'редактирование поста' do
  subject
  expect(response).to render_template :edit
end


end

describe "#update" do

  let!(:comment) { create :comment, post: post, user: user }

  subject { process :update, method: :patch, params: { post_id: post.id, id: comment.id, comment: { body: 'zxc' } } }

  it "редактирование комментария" do 

    subject
    expect(comment.reload.body).to eq('zxc')
  end

end



describe "#destroy" do

  let!(:comment) { create :comment, post: post, user: user }

  subject { process :destroy, method: :delete, params: { post_id: post.id, id: comment.id } }

  it 'удаление поста' do

    expect { subject }.to change(Comment, :count).by(-1)

  end


end




end