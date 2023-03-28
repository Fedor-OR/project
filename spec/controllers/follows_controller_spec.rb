require 'rails_helper'

RSpec.describe FollowsController, type: :controller do

  let!(:user) { create(:user) }
  before { sign_in user }


  describe '#create' do

    subject { process :create, method: :post, params: params }

    let!(:follower) { create :user }
    let(:params) { { id: follower.id } }

    it 'создание подписки в бд' do
      expect { subject }.to change(Follow, :count).by(1)
    end

  end

  describe '#destroy' do

    # subject { process :destroy, method: :delete, params: :id { id: follower.id }, { id: folowee.id } } 
    subject { process :destroy, method: :delete, params: params }

    # let!(:follow) {create :follow }
    let!(:followee) { create :user }  
    before { user.followees << followee }
    # let!(:follower) { create :user }
    # let!(:params) { id: { id: follower.id }, { id: folowee.id } }
    let!(:params) { { id: followee.id } }
    # let(:params) { { followee_id: user.id } }

    it 'отписка' do
      expect { subject }.to change(Follow, :count).by(-1)
    end

  end

describe '#followers' do

  # subject { get :followers }

  # let!(:follower) { create :user }
  # let(:params) { { id: follower.id } }

  subject { process :followers, method: :get, params: params }

  let(:params) { { id: user.id } }


  it 'отображение подписчиков пользователя' do
    subject
    expect(response).to render_template :followers
  end

end 


describe '#following' do

  subject { process :following, method: :get, params: params }

  let(:params) { { id: user.id } }

  it 'отображение тех, на кого подписан пользователь' do
    subject
    expect(response).to render_template :following
  end

end


end