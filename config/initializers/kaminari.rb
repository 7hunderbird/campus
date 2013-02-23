#http://activeadmin.info/docs/0-installation.html#will_paginate_compatibility
Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end