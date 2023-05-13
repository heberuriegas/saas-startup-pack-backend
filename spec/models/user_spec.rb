# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'without user invitation' do
    before(:each) do
      @user = create(:user_without_confirmation)
    end

    it 'need confirmation' do
      expect(@user.confirmed?).to eq(false)
    end
  end
end
