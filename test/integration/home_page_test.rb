require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'stats on the Home page' do
    log_in_as(@user)
    get root_path

    assert_select 'strong#following', text: @user.following.count.to_s
    assert_select 'strong#followers', text: @user.followers.count.to_s
  end
end
