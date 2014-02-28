require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post upload" do
    old_purchaser_count = Purchaser.count
    tsv_file = fixture_file_upload('files/example_input.tab', 'application/octet-stream')
    post :upload, :data_file => {:file => tsv_file}

    assert_equal "example_input.tab", assigns(:uploaded_file_name)
    assert_equal 95.0, assigns(:gross_revenue)
    assert_equal flash[:notice], "File upload succeeded!"

    assert_equal 0, old_purchaser_count
    assert_equal 3, Purchaser.count

    assert_response :success
  end

end
