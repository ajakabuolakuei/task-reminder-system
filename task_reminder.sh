#!/usr/bin/env bash
# task_reminder.sh
# Daily Task Reminder System - DIMMUNITY COMPUTING ACADEMY
# July - August 2025

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TASK_FILE="$script_dir/tasks.txt"

# Ensure tasks file exists
touch "$TASK_FILE"

show_help() {
  cat <<EOF
Usage: $0 [--remind|--help]
  --remind   : non-interactive mode (for cron). Sends a desktop notification if possible,
               otherwise prints tasks to stdout.
  --help     : show this help
Run without args to open the interactive menu.
EOF
}

add_task() {
  while true; do
    read -r -p "Enter your new task: " task
    # trim whitespace
    task="$(echo "$task" | sed -e 's/^[[:space:]]//' -e 's/[[:space:]]$//')"
    if [ -z "$task" ]; then
      echo "Task cannot be empty. Please try again."
    else
      echo "$task" >> "$TASK_FILE"
      echo "Task added."
      break
    fi
  done
}

view_tasks() {
  if [ ! -s "$TASK_FILE" ]; then
    echo "No tasks found."
    return
  fi
  echo "Your tasks:"
  nl -w2 -s'. ' "$TASK_FILE"
}

remove_task() {
  if [ ! -s "$TASK_FILE" ]; then
    echo "No tasks to remove."
    return
  fi
  view_tasks
  while true; do
    read -r -p "Enter the task number to remove: " num
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
      echo "Invalid number. Try again."
      continue
    fi
    total=$(wc -l < "$TASK_FILE")
    if [ "$num" -lt 1 ] || [ "$num" -gt "$total" ]; then
      echo "Task number out of range. Try again."
      continue
    fi
    sed -i "${num}d" "$TASK_FILE"
    echo "Task removed."
    break
  done
}

remind_mode() {
  if [ ! -s "$TASK_FILE" ]; then
    message="No tasks for today. Enjoy!"
  else
    message="$(nl -w2 -s'. ' "$TASK_FILE")"
  fi

  if command -v notify-send >/dev/null 2>&1; then
    if [ -n "$DISPLAY" ]; then
      notify-send "Daily Tasks Reminder" "$message"
    else
      DISPLAY=:0 notify-send "Daily Tasks Reminder" "$message" 2>/dev/null || echo "$message"
    fi
  else
    echo "$message"
  fi
}

# argument handling
if [ $# -gt 0 ]; then
  case "$1" in
    --remind) remind_mode; exit 0 ;;
    --help) show_help; exit 0 ;;
    *) echo "Unknown option: $1"; show_help; exit 1 ;;
  esac
fi

# interactive menu
while true; do
  echo
  echo "===== DAILY TASK REMINDER MENU ====="
  echo "1) Add Task"
  echo "2) View Tasks"
  echo "3) Remove Completed Task"
  echo "4) Exit"
  echo "===================================="
  read -r -p "Enter your choice [1-4]: " choice
  case "$choice" in
    1) add_task ;;
    2) view_tasks ;;
    3) remove_task ;;
    4) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid choice. Try again.";;
esac
done