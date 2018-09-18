module Jekyll
  module CodeTabs
    class CodeTabsTag < Liquid::Tag
      def initialize(_, args, _)
        super
      end

      def render(context)
        <<HTML
<ul uk-tab>
    <li><a href="#">Item</a></li>
    <li><a href="#">Item</a></li>
    <li><a href="#">Item</a></li>
</ul>

<ul class="uk-switcher uk-margin">
    <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</li>
    <li>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
    <li>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur, sed do eiusmod.</li>
</ul>
HTML
      end

      private

      # | markdownify

    end
  end
end

Liquid::Template.register_tag("code_tabs", Jekyll::CodeTabs::CodeTabsTag)
