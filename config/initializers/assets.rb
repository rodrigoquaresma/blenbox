# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

base_css   = %w( site.css fills_time.css chi_square.css ux_calculators.css bbq.css )
base_js    = %w( site.js fills_time.js chi_square.js ux_calculators.js bbq.js )
vendor_css = %w( )
vendor_js  = %w( modernizr-2.8.3.js )

Rails.application.config.assets.precompile += [ base_css, base_js, vendor_css, vendor_js ].flatten
