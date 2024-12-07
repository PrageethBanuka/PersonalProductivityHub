# **Personal Productivity Hub**

## **Overview**
The **Personal Productivity Hub** is a dual-interface application designed to optimize task management and habit tracking. It offers a **web application** for streamlined task visualization and a **desktop application** for offline task handling, detailed reporting, and synchronization with a REST API. Built with a minimalistic and modern approach, this app is tailored for efficiency and ease of use.

---

## **Features**

### **Web Application**
- **Task Management**: Add, edit, delete, and organize tasks.
- **Habit Tracker**: Monitor habit streaks and visualize progress with charts.
- **Customizable Dashboard**: Tailor the interface to your preferences.

### **Desktop Application**
- **Offline Task Management**: Store and manage tasks locally using SQLite.
- **Report Generation**: Export tasks and habits as PDFs or CSV files.
- **Data Synchronization**: Sync offline data with the web application via a REST API.

### **Optional Features**
- **Task Prioritization Insights**: Recommendations for task importance based on deadlines and user patterns.
- **Natural Language Task Input**: Add tasks using simple commands like, *"Prepare slides by Monday at 3 PM."*

---

## **Technologies Used**
- **Frontend (Web Application)**:
  - ReactJS
  - Material-UI / TailwindCSS
  - Chart.js (for data visualization)
  - Axios (for API calls)

- **Backend (REST API)**:
  - REST API template from [GitHub](https://github.com/Teach-Computing/sample-rest-api).

- **Desktop Application**:
  - C# with WinForms or WPF
  - SQLite (local database for offline functionality)

---

## **Setup Instructions**

### **1. Web Application**
1. Clone the repository:
   ```bash
   git clone https://github.com/YourUsername/Enhanced-Productivity-Hub.git
   cd Enhanced-Productivity-Hub/web-app
