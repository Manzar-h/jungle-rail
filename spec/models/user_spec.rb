RSpec.describe User, type: :model do

  describe 'Validations' do
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
      user2 = User.new(email: "Test@example.com", first_name: "Jane", last_name: "Doe", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
    end
    
    it "password should have a minimum length of 8 characters" do
      user = User.new(email: "test@example.com", first_name: "John", last_name: "Doe", password: "pass", password_confirmation: "pass")
      expect(user).to_not be_valid
    end   
  end
end

