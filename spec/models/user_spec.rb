require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of (:name) }
  it { is_expected.to have_one_attached(:avatar) }
  it { is_expected.to have_many (:posts) }
  it { is_expected.to have_many (:comments) }
  it { is_expected.to have_many (:likes) }
  it { is_expected.to have_many (:followed_users) }
  it { is_expected.to have_many (:followees) }
  it { is_expected.to have_many (:following_users) }
  it { is_expected.to have_many (:followers) }
end
