require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post upload" do
    initial_purchaser_count = Purchaser.count
    initial_item_count = Item.count
    initial_merchant_count = Merchant.count
    initial_purchases_count = Purchase.count

    tsv_file = fixture_file_upload('files/example_input.tab', 'application/octet-stream')
    post :upload, :data_file => {:file => tsv_file}

    assert_equal "example_input.tab", assigns(:uploaded_file_name)
    assert_equal 95.0, assigns(:gross_revenue)
    assert_equal flash[:notice], "File upload succeeded!"

    assert_equal 0, initial_purchaser_count
    assert_equal 3, Purchaser.count

    assert_equal 0, initial_item_count
    assert_equal 3, Item.count

    assert_equal 0, initial_merchant_count
    assert_equal 3, Merchant.count

    assert_equal 0, initial_purchases_count
    assert_equal 4, Purchase.count

    assert_response :success
  end

end
