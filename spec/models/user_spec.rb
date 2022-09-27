require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # validation tests/examples here

    it 'should create new user and have passwords present' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end

    it 'should create new user with matching passwords' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end

    it 'should create new user with passwords NOT matching' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "oops"
      )
      
      expect(@user.save).to be(false)
    end

    it 'should have a unique email (not case sensitive)' do
      @user1 = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      expect(@user1.save).to be(true)
      
      @user2 = User.new(
        :firstname => "Colt2", 
        :lastname => "Bit2", 
        :email => "Coltbit@test.com",
        :password => "test2",
        :password_confirmation => "test2"
      )
      expect(@user2.save).to be(false)
    end
    
    it 'should have email' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end
    
    it 'should not pass when email empty' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(false)
    end
    
    it 'should have firstname' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end
    
    it 'should not save if firstname not present' do
      @user = User.new(
        :firstname => "", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      
      expect(@user.save).to be(false)
    end
    
    it 'should have lastname' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end
    
    it 'should not save if lastname not present' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(false)
    end
    
    it 'should not save when password less than minimum length' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "te",
        :password_confirmation => "te"
      )

      expect(@user.save).to be(false)
    end
    
    it 'should save when password exceeds minimum length' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )

      expect(@user.save).to be(true)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return the correct user' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      @user.save!
      user = User.authenticate_with_credentials(@user.email, @user.password)

      expect(user).to eq(@user)
    end

    it 'should not return the correct user with bad password' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      @user.save!
      user = User.authenticate_with_credentials(@user.email, "tes")

      expect(user).to_not eq(@user)
    end

    it 'should return the correct user when spaces before/after email' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      @user.save!
      user = User.authenticate_with_credentials("  #{@user.email} ", @user.password)

      expect(user).to eq(@user)
    end

    it 'should return the correct user when wrong case used in email' do
      @user = User.new(
        :firstname => "Colt", 
        :lastname => "Bit", 
        :email => "coltbit@test.com",
        :password => "test",
        :password_confirmation => "test"
      )
      @user.save!
      user = User.authenticate_with_credentials(@user.email.upcase, @user.password)

      expect(user).to eq(@user)
    end
  end
end
