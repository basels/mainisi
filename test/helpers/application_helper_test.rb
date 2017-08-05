require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "fulle title helper" do
    assert_equal full_title,         "Mainisi"
    assert_equal full_title("Help"), "Help | Mainisi"
  end
end
