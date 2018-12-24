Rails.application.configure do
  
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = true
  #config.consider_all_requests_local = false

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  
  # deviseのメール送信機能
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # レターオープナー
  config.action_mailer.default_url_options = { host: 'localhost3000' }
  config.action_mailer.delivery_method = :letter_opener

  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
