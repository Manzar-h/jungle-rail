require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: "Manzar",
        last_name: "Hussain",
        email: "example@domain.com",
        password: "testing12",
        password_confirmation: "testing12",
      )
    end

    it "should have a password and password_confirmation fields" do
      user = User.new(email: "test@example.com", first_name: "John", last_name: "Doe")
      expect(user).to_not be_valid
    end

    it "password and password_confirmation fields should match" do
      user = User.new(email: "test@example.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: "not_matching")
      expect(user).to_not be_valid
    end

    it "should be created with email, first name, and last name" do
      user = User.new(password: "password", password_confirmation: "password")
      expect(user).to_not be_valid
    end

    it "emails should be unique (not case sensitive)" do
      user1 = User.create(email: "test@example.com", first_name: "John", last_name: "Doe", password: "password", password_confirmation: "password")
      user2 = User.new(email: "test@example.com", first_name: "Jane", last_name: "Doe", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
    end

    it "password should have a minimum length of 8 characters" do
      user = User.new(email: "test@example.com", first_name: "John", last_name: "Doe", password: "pass", password_confirmation: "pass")
      expect(user).to_not be_valid
    end

    it "should create a new user when all input is filled out" do
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end
    
    it "should not create a new user when no password confirmation is provided" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
    
    it "should not create a new user when no password is provided" do
      @user.password = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "should not create a new user when no password confirmation is provided" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    
    it "should give an error when no email is provided" do
      @user.email = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "should give an error when no first name is provided" do
      @user.first_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "should give an error when no last name is provided" do
      @user.last_name = nil
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "should give an error when a an email is already in database" do
      @user.save
      @user2 = User.new(
        first_name: "Manzar",
        last_name: "Hussain",
        email: "example@domain.com",
        password: "testing",
        password_confirmation: "testing",
      )
      expect(@user2).not_to be_valid
    end
    
    it "should give an error when password length is less than 8 characters" do
      @user.password = "testing"
      @user.password_confirmation = "testing"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end    
  end
end