# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

base_js    = %w( site.js )
vendor_js  = %w( modernizr-2.8.3.js )
base_css   = %w( site.css )
vendor_css = %w(  )

Rails.application.config.assets.precompile += [ base_css, base_js, vendor_css, vendor_js ].flatten
