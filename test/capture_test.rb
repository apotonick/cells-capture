require 'test_helper'

class MusiciansController < ActionController::Base
  append_view_path("test/views")

  def show
  end
end








class BassistCell < Cell::Rails
  append_view_path("test/views")
  attr_accessor :data_from_block
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
    assert_includes @response.body, "keep me!<pre>DummDooDiiDoo</pre>"
  end

  test "#render_cell passes arguments to the cell" do
    get 'show'
    assert_includes @response.body, "I am data from block"
  end
end
