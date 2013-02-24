require 'test_helper'

class MusiciansController < ActionController::Base
  append_view_path("test/views")

  def show
  end
end








class BassistCell < Cell::Rails
  append_view_path("test/views")

  #helper ::Cells::Helpers::CaptureHelper
  def content_for 
    render 
  end

      
  include Cell::Rails::Capture
end

class CaptureTest < ActionController::TestCase
  tests MusiciansController

  test "#content_for" do
    get 'show'
    assert_equal "\n\n\nkeep me!<pre>DummDooDiiDoo</pre>", @response.body
  end
end
