require 'cell/rails'

module Cell
  class Rails
    module Capture
      extend ActiveSupport::Concern
      included do
        helper ContentForExtension
      end

      attr_accessor :global_tpl

      module RenderCellExtension
        def render_cell(*args)
          super(*args) do |cell| # FIXME: block gets lost.
            cell.global_tpl = self if cell.is_a? ::Cell::Rails::Capture
          end
        end
      end

      module ContentForExtension
        def content_for(name, content=nil, &block)
          # this resembles rails' own #content_for INTENTIONALLY. Due to some internal rails-thing we have to call #capture on the cell's view, otherwise,
          # rails wouldn't suppress the captured output. uncomment next line to provoke.
          #cnt = @tpl.capture(&block)

          if content || block_given?
            content = capture(&block) if block_given?
            @global_tpl.view_flow.append(name, content) if content
            nil
          else
            @view_flow.get(name)
          end
        # i would love to simply do this:
        # TODO: refactor rails helper.
        #@tpl.content_for(*args, &block)
        #nil
        end
      end

    end
  end
end

# TODO: can we avoid monkey-patching #render_cell?
ActionView::Base.class_eval do
  include Cell::Rails::Capture::RenderCellExtension
end
