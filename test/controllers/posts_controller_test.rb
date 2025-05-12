require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select "h1", "Blog Posts"
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { title: "New post", content: "New content" } }
    end

    assert_redirected_to posts_url
  end

  test "should create post with turbo_stream" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { title: "New post", content: "New content" } },
           as: :turbo_stream
    end

    assert_response :success
    assert_match /<turbo-stream/, @response.body
  end

  test "should not create invalid post" do
    assert_no_difference("Post.count") do
      post posts_url, params: { post: { title: "", content: "" } }
    end

    assert_response :unprocessable_entity
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
    assert_select "h1", @post.title
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { title: "Updated Title", content: "Updated content" } }
    assert_redirected_to post_url(@post)

    @post.reload
    assert_equal "Updated Title", @post.title
    assert_equal "Updated content", @post.content
  end

  test "should update post with turbo_stream" do
    patch post_url(@post), params: { post: { title: "Updated Title", content: "Updated content" } },
          as: :turbo_stream

    assert_response :success
    assert_match /<turbo-stream/, @response.body

    @post.reload
    assert_equal "Updated Title", @post.title
    assert_equal "Updated content", @post.content
  end

  test "should not update invalid post" do
    patch post_url(@post), params: { post: { title: "", content: "" } }
    assert_response :unprocessable_entity
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "should destroy post with turbo_stream" do
    assert_difference("Post.count", -1) do
      delete post_url(@post), as: :turbo_stream
    end

    assert_response :success
    assert_match /<turbo-stream action="remove"/, @response.body
  end
end
