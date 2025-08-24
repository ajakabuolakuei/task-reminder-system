# 🗓️ Daily Task Reminder System

A simple **command-line task manager** and **daily reminder system** written in Bash.  
It helps you stay productive by letting you add, view, and remove tasks, while also sending **desktop notifications** of pending tasks.  

💡 Perfect for Linux users who want a lightweight, offline-friendly reminder system.  

---

## ✨ Features

- ✅ Add daily tasks  
- 📋 View tasks with numbering  
- ❌ Remove completed tasks by number  
- 🔔 Daily reminders using `notify-send`  
- ⚡ Works interactively or via **cron automation**  
- 📝 Saves tasks persistently in a `tasks.txt` file  

---

## 📂 Project Structure

```
task-reminder/
│── task_reminder.sh   # Main Bash script
│── tasks.txt          # Task storage file (auto-created)
│── README.md          # Project documentation
```

---

## ⚙️ Installation

1. Clone the project:
   ```bash
   git clone https://github.com/your-username/task-reminder.git
   cd task-reminder
   ```

2. Make the script executable:
   ```bash
   chmod +x task_reminder.sh
   ```

3. (Optional) Add it to your PATH:
   ```bash
   sudo cp task_reminder.sh /usr/local/bin/task_reminder
   ```

---

## ▶️ How to Run the System

There are two main ways to run the system: **Interactive Mode** and **Reminder Mode**.

### 1️⃣ Interactive Mode (Task Manager)
Run the script without arguments:
```bash
./task_reminder.sh
```

This opens the interactive menu:

```
===== DAILY TASK REMINDER MENU =====
1) Add Task
2) View Tasks
3) Remove Completed Task
4) Exit
====================================
Enter your choice [1-4]:
```

- **Option 1** → Add new tasks  
- **Option 2** → View all tasks  
- **Option 3** → Remove a completed task  
- **Option 4** → Exit the program  

---

### 2️⃣ Reminder Mode (Show Daily Tasks)
Run with `--remind` to view or get notified of your tasks:
```bash
./task_reminder.sh --remind
```

Example output:
```
Your tasks:
 1. Finish Bash Project
 2. Review Notes for Exam
```

If `notify-send` is installed, a desktop notification pops up:  
> 🔔 **Daily Tasks Reminder**  
> 1. Finish Bash Project  
> 2. Review Notes for Exam  

---

### 3️⃣ Help Option
View usage instructions:
```bash
./task_reminder.sh --help
```

---

## ⏰ Automating with Cron

To receive reminders **every morning at 8:00 AM**:

```bash
crontab -e
```

Add the following line:
```cron
0 8 * * * DISPLAY=:0 /bin/bash /home/username/task-reminder/task_reminder.sh --remind
```

> ⚠️ Replace `/home/username/task-reminder/` with your actual script path.

---

## 📋 Example Workflow

```bash
$ ./task_reminder.sh

===== DAILY TASK REMINDER MENU =====
1) Add Task
2) View Tasks
3) Remove Completed Task
4) Exit
====================================
Enter your choice [1-4]: 1
Enter your new task: Finish Bash Project
Task added.

Enter your choice [1-4]: 2
Your tasks:
 1. Finish Bash Project
```

---

## 🛠 Dependencies

- **bash** (default shell on Linux)
- **notify-send** (optional, for desktop notifications)

Install notify-send on Ubuntu/Debian:
```bash
sudo apt install libnotify-bin
```

---

## 📌 Roadmap / Future Ideas

- ⏳ Add deadlines & due dates  
- 📊 Export tasks to CSV or Markdown  
- 🌐 Sync with cloud storage (Google Drive/Dropbox)  
- 📱 Mobile notification integration  

---

## 👤 Author

Developed by **DIMMUNITY COMPUTING ACADEMY**  
Maintainer: **Ajak Abuol Akuei**

---

## 📄 License

This project is licensed under the **MIT License** – free to use and modify.  
