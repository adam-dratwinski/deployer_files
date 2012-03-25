APP_PATH = "<%= app_path %>/current" 
APP_NAME = "<%= app_name %>" #gittest

working_directory APP_PATH

pid "#{APP_PATH}/tmp/pids/unicorn.pid"
stderr_path "#{APP_PATH}/log/unicorn.log"
stdout_path "#{APP_PATH}/log/unicorn.log"

listen "/tmp/unicorn.#{APP_NAME}.sock"
worker_processes 2
timeout 30
