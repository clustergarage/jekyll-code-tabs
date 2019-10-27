require "erb"
require 'securerandom'
require_relative "jekyll-code-tabs/version"

module Jekyll
  module CodeTabs
    class CodeTabsBlock < Liquid::Block
      def render(context)
        environment = context.environments.first
        environment['codetabs'] = {} # reset each time
        super

        uuid = SecureRandom.uuid
				template = ERB.new <<-EOF
<!-- Tab links -->
<div class="tab">
  <% environment['codetabs'].each_with_index do |(key, _), index| %> 
    <button class="tablinks" id="<%= index == 0 ? 'default' : '' %>" onclick="showTab(event, '<%= key %>')"><%= key %></button>
  <% end %>
</div>

<!-- Tab content -->
<% environment['codetabs'].each do |key, value| %>
<div id="<%= key %>" class="tabcontent">
  <%= value %>
</div>
<% end %>
EOF
				template.result(binding)
      end
    end

    class CodeTabBlock < Liquid::Block
      alias_method :render_block, :render

      def initialize(tag_name, markup, tokens)
        super
        if markup == ""
          raise SyntaxError.new("No toggle name given in #{tag_name} tag")
        end
        @toggle = markup.strip
      end

      def render(context)
        site = context.registers[:site]
        converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        environment = context.environments.first
        environment['codetabs'] ||= {}
        environment['codetabs'][@toggle] = converter.convert(render_block(context))
      end
    end
  end
end

Liquid::Template.register_tag("codetab", Jekyll::CodeTabs::CodeTabBlock)
Liquid::Template.register_tag("codetabs", Jekyll::CodeTabs::CodeTabsBlock)
