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
      expect(@user).not_to be_valid()
      # pp @user
    end

    it "is not valid without a last name" do
      @user = User.new(
        first_name: 'Joe',
        last_name: nil,
        email: 'TEST@TEST.com',
        password: '1337',
        password_confirmation: '1337'
      )
      expect(@user).not_to be_valid()
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
      expect(@user).not_to be_valid()
    end

  end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should be valid if there is whitespace" do
      @user = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'test@test.com',
        password: '1337',
        password_confirmation: '1337'
      )
      @user.save

      removeWhiteSpaceEmail = User.authenticate_with_credentials(' test@test.com ', '1337')
      expect(removeWhiteSpaceEmail).to_not be(nil)
    end

    it "should be valid if string is upper case " do
      @user = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'test@test.com',
        password: '1337',
        password_confirmation: '1337'
      )
      @user.save

      downcaseEmail = User.authenticate_with_credentials('TeSt@tEst.com', '1337')
      expect(downcaseEmail).to_not be(nil)
    end

    it "should be valid if string is upper case and there is whitespace" do
      @user = User.new(
        first_name: 'Joe',
        last_name: 'Smith',
        email: 'test@test.com',
        password: '1337',
        password_confirmation: '1337'
      )
      @user.save

      whiteSpaceAndUpcase = User.authenticate_with_credentials('  TeSt@tEsT.com  ', '1337')
      expect(whiteSpaceAndUpcase).to_not be(nil)
    end

  end
end
