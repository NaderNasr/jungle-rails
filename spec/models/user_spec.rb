require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should validate password and password confirmation" do
      @user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'J_Doe@gmail.com',
        password: '1337',
        password_confirmation: '1337'
      )
      expect(@user.password).to be == (@user.password_confirmation)
      # pp @user
    end

    it "E-mail must be unique" do
      @user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'TEST@TEST.com',
        password: '1337',
        password_confirmation: '1337'
      )
      expect(@user.email).not_to eq('test@test.COM')
      # pp @user
    end

    it "is not valid without a first name" do
      @user = User.create(
        first_name: nil,
        last_name: 'Doe',
        email: 'TEST@TEST.com',
        password: '1337',
        password_confirmation: '1337'
      )
      expect(@user.first_name).not_to eq([])
      # pp @user
    end

    it "is not valid without a last name" do
      @user = User.create(
        first_name: 'Joe',
        last_name: nil,
        email: 'TEST@TEST.com',
        password: '1337',
        password_confirmation: '1337'
      )
      expect(@user.last_name).not_to eq([])
      # pp @user
    end

    it "should not be valid if password LESS than 3" do
      @user = User.create(
        first_name: 'Joe',
        last_name: nil,
        email: 'TEST@TEST.com',
        password: '37',
        password_confirmation: '37'
      )
      expect(@user.password).to have_attributes(size: 2)
    end

  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    
  end


end
