require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
    
    def setup
        @article = Article.new(name: "Printer Setup", summary: "This is how to setup the Printer", description: "Put together printer frame, turn on laptop, upload photo and print")
    end
    
    test "article should be valid" do
        assert @article.valid?
    end
    
    test "name must be present" do
        @article.name = ""
        assert_not @article.valid?
    end
    
    test "name length should not be too long" do
       @article.name = "a" * 101
       assert_not @article.valid?
    end
    
    test "name length must not be too short" do
        @article.name = "a" * 4
        assert_not @article.valid?
    end
    
    test "summary must be present" do
        @article.summary = ""
        assert_not @article.valid?
    end
    
    test "summary must not be too long" do
        @article.summary = "a" * 151
        assert_not @article.valid?
    end
    
    test "summary must not be too short" do
        @article.summary = "a" * 9
        assert_not @article.valid?
    end
    
    test "description must be present" do
        @article.description = ""
        assert_not @article.valid?
    end
    
    test "description must not be too long" do
        @article.description = "a" * 501
        assert_not @article.valid?
    end
    
    test "description must not be too short" do
        @article.description = "a" * 19
        assert_not @article.valid?
    end
   
end