require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new(content: "Test content")
    assert_not post.save, "Saved the post without a title"
  end

  test "should not save post without content" do
    post = Post.new(title: "Test title")
    assert_not post.save, "Saved the post without content"
  end

  test "should save valid post" do
    post = Post.new(title: "Test title", content: "Test content")
    assert post.save, "Could not save a valid post"
  end

  # test "the truth" do
  #   assert true
  # end
end
