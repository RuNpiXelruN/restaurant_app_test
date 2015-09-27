require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
    def setup
        @user = User.new(username: "Justin Test", email: "justintest@test.com")
    end
    
    test "user should be valid" do
       assert @user.valid? 
    end
    
    test "username should be present" do 
        @user.username = ""
        assert_not @user.valid?
    end
    
    test "username should not be too long" do 
        @user.username = "a" * 41
        assert_not @user.valid?
    end
    
    test "username should not be too short" do
        @user.username = "a" * 4
        assert_not @user.valid?
    end
    
    test "email must be present" do 
       @user.email = ""
       assert_not @user.valid?
    end
    
    test "email should not be too long" do
        @user.email = "a" * 101 + "@test.com"
        assert_not @user.valid?
    end
    
    test "email address should be unique" do
       dup_user = @user.dup
       dup_user.email = @user.email.upcase
       @user.save
       assert_not @user.dup.valid?
    end
    
    test "email validation should accept valid email addresses" do
        valid_addresses = %w[user@ttt.com 12-the_rhr@example.net hello123@meeee.co ashlkjas-asdlkha@fhfkjhlf.com.au]
        valid_addresses.each do |va|
            @user.email = va
            assert @user.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email validation should reject invalid email addresses" do
        invalid_addresses = %w[asd@com asdf@sadf-com_ghk lkajl_aa@aaa,com aaa@asdfa?com]
        invalid_addresses.each do |ia|
            @user.email = ia
            assert_not @user.valid?, '#{ia.inspect} should be invalid'
        end
    end
end