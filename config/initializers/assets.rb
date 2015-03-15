# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

base_js    = %w( site/site.js blenbox/blenbox.js oxys/oxys.js oxys/guide.js vangogh.js )
vendor_js  = %w( dragdealer.js jquery-1.9.1.js shortcut.js modernizr-2.8.3.js jquery.elastislide.js modernizr.custom.17475 modernizr.custom.17475.js )
base_css   = %w( site/styles-dark.css blenbox/blenbox.css oxys/oxys.css oxys/guide.css oxys/header.css oxys/mainmenu-geral.css oxys/mainmenu-covers.css vangogh.css )
vendor_css = %w( dragdealer.css ui/1.10.2/themes/smoothness/jquery-ui.css elastislide.css )

Rails.application.config.assets.precompile += [ base_css, base_js, vendor_css, vendor_js ].flatten
