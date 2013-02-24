# cells-capture

Provides a global (brrr) `#content_for` for Cells.


# Installation

	gem 'cells-capture'


# Usage

Include the module in all your cell classes that require a global (brrr) `#content_for`.

	class BassistCell < Cell::Rails
	  include Cell::Rails::Capture

	  def show
	    render
	  end
	end

In your cell view you use `#content_for`.

	%div
	  - content_for :javascripts
	    $('#pick').append("Yo!")

The captured content is now available globally (brrr) in your controller views or your layouts.

# Limitations

Currently, if you passed a block to `#render_cell` in your view this won't work anymore.

Also, I want to note that I am not a big fan of breaking cells' encapsulation by emiting content into a global (brrr) variable. However, as many people asked for it I provide this feature to improve the world's happiness factor.