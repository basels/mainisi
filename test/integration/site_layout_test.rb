require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout_links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    #assert_select "a[href=?]", stories_path TODO
    #assert_select "a[href=?]", users_path TODO
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", signup_path
    #TODO: rest of the links
  end
end
