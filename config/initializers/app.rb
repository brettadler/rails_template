# https://thoughtbot.com/blog/content-compression-with-rack-deflater
# Rails.application.config.middleware.insert_after ActionDispatch::Static, Rack::Deflater

Rails.application.config.active_job.queue_adapter = :delayed_job
