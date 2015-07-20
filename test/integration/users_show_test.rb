require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @active_user = users(:michael)
    @inactive_user = users(:archer)
  end

  test 'should show only activated users' do
    log_in_as(@active_user)
    @inactive_user.update(activated: false)

    get user_path(@inactive_user)
    assert_response :redirect
    assert_redirected_to root_url
  end
end
