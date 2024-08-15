#!/bin/bash

start_date="2023-01-01T00:00:00Z"
hosts=("server1" "server2" "server3" "server4")
levels=("INFO" "WARN" "ERROR" "DEBUG")
messages=(
    "Application initialized successfully"
    "Loading configuration from config.yaml"
    "User login successful"
    "API rate limit nearing threshold"
    "Configuration file missing"
    "Backup completed successfully"
    "New user registered"
    "Server restarted for maintenance"
    "Cache invalidated"
    "Daily report generated"
    "Scheduled database maintenance"
    "Debug mode enabled"
    "Service timeout during API request"
    "Holiday mode activated"
    "Low disk space on server"
    "Disk cleanup completed"
    "Session expired for user"
    "Software update applied"
    "Failed to connect to external service"
    "Connection reestablished with database"
    "User session extended"
    "System health check passed"
    "High memory usage detected"
    "Memory usage optimized"
    "Application reached peak load"
    "Debugging session started"
    "Access denied for user operation"
    "User permissions updated"
    "Maintenance window closed"
    "End of year summary generated"
)
users=("john_doe" "jane_smith" "admin" "guest" "alice_smith" "bob_jones" "charlie_kim")
errors=("FileNotFoundError" "TimeoutException" "ConnectionRefused" "PermissionDenied" "UpdateFailed" "UploadError" "ServerError" "SecurityAlert")
pids=(1023 2048 3056 1234 4321 5678 6789 7890 8901 9012 2468 1357 9753 8642 7531 6420 5319 4208 3097 1986 2874 3765 4657 5548 6439 7321 8210 9102 1019 1109)
tasks=("task_2023_07_05")
reports=("report_2023_10_15" "summary_2024")

for i in {0..29}; do
  timestamp=$(date -u -d "$start_date + $i hour" +"%Y-%m-%dT%H:%M:%SZ")
  host=${hosts[$RANDOM % ${#hosts[@]}]}
  level=${levels[$RANDOM % ${#levels[@]}]}
  message=${messages[$RANDOM % ${#messages[@]}]}
  pid=${pids[$RANDOM % ${#pids[@]}]}
  user=${users[$RANDOM % ${#users[@]}]}
  error=${errors[$RANDOM % ${#errors[@]}]}
  task_id=${tasks[$RANDOM % ${#tasks[@]}]}
  report_id=${reports[$RANDOM % ${#reports[@]}]}

  # Determine if this log entry should include user, error, task_id, or report_id
  if [[ "$message" =~ "login" || "$message" =~ "session" || "$message" =~ "permissions" || "$message" =~ "deactivated" ]]; then
    echo "{\"timestamp\": \"$timestamp\", \"level\": \"$level\", \"message\": \"$message\", \"host\": \"$host\", \"pid\": $pid, \"user\": \"$user\"}"
  elif [[ "$message" =~ "error" || "$message" =~ "failed" || "$message" =~ "denied" || "$message" =~ "Unauthorized" ]]; then
    echo "{\"timestamp\": \"$timestamp\", \"level\": \"$level\", \"message\": \"$message\", \"host\": \"$host\", \"pid\": $pid, \"error\": \"$error\"}"
  elif [[ "$message" =~ "task" ]]; then
    echo "{\"timestamp\": \"$timestamp\", \"level\": \"$level\", \"message\": \"$message\", \"host\": \"$host\", \"pid\": $pid, \"task_id\": \"$task_id\"}"
  elif [[ "$message" =~ "report" || "$message" =~ "summary" ]]; then
    echo "{\"timestamp\": \"$timestamp\", \"level\": \"$level\", \"message\": \"$message\", \"host\": \"$host\", \"pid\": $pid, \"report_id\": \"$report_id\"}"
  else
    echo "{\"timestamp\": \"$timestamp\", \"level\": \"$level\", \"message\": \"$message\", \"host\": \"$host\", \"pid\": $pid}"
  fi
done
