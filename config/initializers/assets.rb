# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

base_js    = %w( site.js fills_time.js chi_square.js ux_calculators.js )
vendor_js  = %w( modernizr-2.8.3.js )
base_css   = %w( site.css fills_time.css chi_square.css ux_calculators.css )
# vendor_css = %w(  )

Rails.application.config.assets.precompile += [ base_js, vendor_js, base_css ].flatten
