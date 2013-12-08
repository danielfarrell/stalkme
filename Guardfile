require 'sass'
require 'compass'
require 'bootstrap-sass'
require 'coffee-script'
require 'sprockets'
require 'sprockets-sass'
require 'sprockets-helpers'

guard :sprockets, destination: 'priv/static/assets', asset_paths: ['web/assets/components', 'web/assets/javascripts', 'web/assets/stylesheets'] do
  watch 'web/assets/javascripts/application.js.coffee'
  watch 'web/assets/stylesheets/application.css.sass'
end

guard :elixir do
  watch(%r{^test/(.*)_test\.exs})
  watch(%r{^lib/(.+)\.ex$})           { |m| "test/#{m[1]}_test.exs" }
  watch(%r{^test/test_helper.exs$})   { "test" }
end
