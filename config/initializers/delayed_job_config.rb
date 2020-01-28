# Settings that can be modified for Delayed Job
# Default setting is included in () next to the setting name

# destroy_failed_jobs (true) - if jobs that have reached max_attempts are destroyed (or marked failed)
# Delayed::Worker.destroy_failed_jobs = false

# sleep_delay (?) - how long the worker sleeps after finding no jobs
Delayed::Worker.sleep_delay = ENV["DELAYED_JOB_SLEEP_DELAY"].present? ? ENV["DELAYED_JOB_SLEEP_DELAY"].to_i : 60

# max_attempts (25) - # of times a job is tried before deleted or marked failed
# Delayed::Worker.max_attempts = 3

# max_run_time (4.hours) - Max time a job is allowed to run
# Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.max_run_time = 60.minutes

# read_ahead (5) - number of jobs to read from the queue when looking for a new one
# Delayed::Worker.read_ahead = 10

# default_queue_name - By default all jobs will be queued without a named queue
# A default named queue can be set here
# Delayed::Worker.default_queue_name = 'default'

# Setting to modify behavior in testing environment
# Delayed::Worker.delay_jobs = !Rails.env.test?

# raise_signal_exceptions (false)
# Delayed::Worker.raise_signal_exceptions = :term

# Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))

# Delayed Job Hook for Error reporting
# Modified from https://www.salsify.com/blog/engineering/delayed-jobs-callbacks-and-hooks-in-rails
class SlackDelayPlugin < Delayed::Plugin
  callbacks do |lifecycle|
    lifecycle.around(:invoke_job) do |job, *args, &block|
      begin
        # Forward the call to the next callback in the callback chain
        block.call(job, *args)

      rescue Exception => error
        if ENV["SLACK_WEBOOK_ERRORS"]
          require 'slack-notifier'
          notifier = Slack::Notifier.new ENV["SLACK_WEBOOK_ERRORS"]
          notifier.ping "Job #{job.id}: #{error.class.name}: #{error.message} on #{ENV['SYSTEM_NAME']}"
          # Other data we could include if we wanted to (but would flood data)
          # error.backtrace
          # job.inspect
        end

        # Make sure we propagate the failure!
        raise error
      end
    end
  end
end

Delayed::Worker.plugins << SlackDelayPlugin
