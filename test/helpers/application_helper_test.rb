require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "fulle title helper" do
    assert_equal full_title,         "Good Vibes"
    assert_equal full_title("Help"), "Help | Good Vibes"
  end
end
