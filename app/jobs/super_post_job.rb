class SuperPostJob < ActiveJob::Base
  queue_as :default

  def perform(*_args)
    # Do something later
    sleep 3
    time_proc = proc { Time.now }
    Post.create(title: "Delayed SuperPost #{time_proc.call}")
  end
end
