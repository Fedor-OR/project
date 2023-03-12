require 'rails_helper'

RSpec.describe PostsController, type: :controller do
let(:user) {create(:user)}

before { sign_in user }


  describe '#index' do
    subject { get :index} 
    let(:posts) { create_list(:post, 3) }

    it "показывает массив постов" do
      subject
    expect(assigns(:posts)).to eq(posts)
    end

    it "рендер вьюхи всех постов" do
      is_expected.to render_template :index
    end
  end 

  describe '#show' do
    subject { get :show, params: params }

    let(:post) {create :post, user: user}
    let(:params) {{id: post.id}} 
  
    it "отображение одного поста" do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it "рендер вьюхи одного поста" do
      is_expected.to render_template :show
    end

    context 'вызов несуществующего поста' do
      let(:params) {{id: post.id+1}}
    
      it "ошибка - запись не найдена" do
        expect{subject}.to raise_exception(ActiveRecord::RecordNotFound) 

      end
    end
  end

  describe '#new' do
    subject { get :new}
  
    it 'рендер вьюхи' do
      is_expected.to render_template :new
    end
  
    it 'создание объекта, без сохранения в базу данных' do
      subject
      expect(assigns(:post)).to be_a_new Post
    end
  end

  describe "#create" do
    subject { post :create, params: params}
    let(:params) { { post: attributes_for(:post, user: create(:user)) } }

    it "создание поста с сохранением в бд" do # attributes for прочитать
      expect { subject }.to change(Post, :count).by(1)
    end
  
    it "редирект сохраненного поста" do
      subject
      expect(response).to redirect_to post_path(Post.last)
    end
  
    # it "не сохранение поста-рендер пустой формы" do
    #   expect(post :params.include?.nil).to render_template :new
    
    
    # end
  
    end
  
  describe "#edit" do
    
    subject { get :show, params: params }

    let(:post) {create :post, user: user}
    let(:params) {{id: post.id}} 
    
    it "отображение одного поста" do
      subject
      expect(assigns(:post)).to eq(post)
    end
  
    it "рендер вьюхи одного поста" do
      is_expected.to render_template :show
    end
  
    context 'вызов несуществующего поста' do
      let(:params) {{id: post.id+1}}
    
      it "ошибка - запись не найдена" do
        expect{subject}.to raise_exception(ActiveRecord::RecordNotFound) 
  
      end
    end
  end  
     
  # создает рандомное выражение в строке, состоит из 10 симвоолов
      # range = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(10){ range.sample }.join 

  describe "#update" do

    let!(:post) {create :post, user: user}
    # subject { patch :update, id: post.id, params: { post: { title: 'qwe', body: 'qwe' } } } 
    
    subject { process :update, method: :patch, params: {id: post.id, post: { title: 'qwe', body: 'qwe' } } }
    # subject { patch :update, :id => post.id, :post => { params: parameters }}
    # title: 'qwe', body: 'qwe'
    # put :update, :params => { :post => { :title => "Any Name" } , :id => post.id}
      # let(:post) {}
      # subject { put :update }
      # subject = Post.new(title: 'qwe', body: 'qwe')
      # let(:params) {{id: post.id}} 

      it "редактирование заголовка поста" do
        subject
        expect(post.reload.title).to eq("qwe")
      end

      it "редактирование текста поста" do
        subject
        expect(post.reload.body).to eq("qwe")
      end
    
  end

  
      # subject { put :update, params: params }
      # let(:post) { create :post, user: user }
      
      # it 'рендер редактированого поста' do
      
      # end

  describe '#destroy' do
      
      let!(:post) { create :post, user: user }

      subject { process :destroy, method: :delete, params: { id: post.id } }

      # subject { post :create, params: params}
      # let(:params) {{post: attributes_for(:post, user: create(:user))}}
  
      # it "создание поста с сохранением в бд" do 
      #   expect {subject}.to change(Post, :count).by(1)
      # end

      it "удаление поста" do
      # надо поменять субьект т.к. этого субьекта не будет в БД (изменить ожидание), переработать сабджект на удаление
      expect { subject }.to change(Post, :count).by(-1)
      
      end

  end

end