require 'rails_helper'

RSpec.describe Follow, type: :model do

  it { is_expected.to belong_to (:follower) }
  it { is_expected.to belong_to (:followee) }

  it { is_expected.to validate_uniqueness_of(:follower_id).scoped_to(:followee_id) }
  it { is_expected.to validate_uniqueness_of(:followee_id).scoped_to(:follower_id) }

end