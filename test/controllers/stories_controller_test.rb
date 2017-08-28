require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:clark_story)
    @admin_user = users(:clark)
    @other_user = users(:bruce)
  end

  #test "should get index" do #TODO: fix
  #  log_in_as(@other_user)
  #  get stories_url
  #  assert_response :success
  #end

  #test "should create story" do #TODO: fix
  #  assert_difference('Story.count') do
  #    post stories_url, params: { story: { content: @story.content, user_id: @story.user_id } }
  #  end
  #  assert_redirected_to story_url(Story.last)
  #end

  #test "should show story" do #TODO: fix
  #  log_in_as(@other_user)
  #  get story_url(@story)
  #  assert_response :success
  #end

  #test "should get edit" do #TODO: fix
  #  log_in_as(@admin_user)
  #  get edit_story_url(@story)
  #  assert_response :success
  #end

  #test "should update story" do #TODO: fix
  #  patch story_url(@story), params: { story: { content: @story.content, user_id: @story.user_id } }
  #  assert_redirected_to story_url(@story)
  #end

  test "should destroy story" do
    log_in_as(@admin_user)
    assert_difference('Story.count', -1) do
      delete story_url(@story)
    end
    assert_redirected_to stories_url
  end
end
