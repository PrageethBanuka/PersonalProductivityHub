using Focusly.Models;
using Focusly.Services;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Storage;
using System.Diagnostics;
using System.ComponentModel;
using CommunityToolkit.Maui.Views;
using Focusly.Views;

namespace Focusly.ViewModels
{
    public class TaskViewModel : BaseViewModel, INotifyPropertyChanged
    {
        private readonly ApiService _apiService;
        private readonly SyncService SyncService;
        public ObservableCollection<TaskModel> Tasks { get; set; } = new();

        private string _newTaskText;
        public string NewTaskText
        {
            get => _newTaskText;
            set
            {
                if (_newTaskText != value)
                {
                    _newTaskText = value;
                    OnPropertyChanged(nameof(NewTaskText)); // Notify that the property has changed
                }
            }
        }

        public ICommand LoadTasksCommand { get; }
        public ICommand AddTaskCommand { get; }
        public ICommand ShowTimerPopupCommand { get; }
        public ICommand LogoutCommand { get; }
        public ICommand DeleteTaskCommand { get; }

        public TaskViewModel() : this(new ApiService(new HttpClient())) { }

        public TaskViewModel(ApiService apiService)
        {
            _apiService = apiService;
            LoadTasksCommand = new Command(async () => await LoadTasks());
            AddTaskCommand = new Command(async () => await AddTask(NewTaskText));
            ShowTimerPopupCommand = new Command<TaskModel>((task) =>
    {
        var popup = new TimerPopup { BindingContext = this };
        Application.Current.MainPage.ShowPopup(popup);
    });
            DeleteTaskCommand = new Command<TaskModel>(async (task) => await DeleteTask(task));
            LogoutCommand = new Command(Logout);
        }

        private async Task LoadTasks()
        {
            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                Debug.WriteLine($"Token = {token}");

                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("⚠ No auth token found.");
                    return;
                }

                var tasks = await _apiService.GetTasksAsync(token);
                if (tasks == null || tasks.Count == 0)
                {
                    Debug.WriteLine("⚠ No tasks found.");
                    return;
                }

                Tasks.Clear();
                foreach (var task in tasks)
                {
                    Tasks.Add(task);
                }

                Debug.WriteLine($"Loaded {tasks.Count} tasks.");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to load tasks: {ex.Message}");
            }
        }

        public async Task AddTask(string text)
        {
            if (string.IsNullOrEmpty(text)) return;

            try
            {
                Debug.WriteLine("✅ AddTask method is triggered.");

                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("⚠ No token found");
                    return;
                }

                var newTask = new TaskModel { Text = text, Completed = false, CreatedAt = DateTime.UtcNow };

                Debug.WriteLine("🔥 Calling AddTaskAsync...");

                // Make sure the method is awaited
                var result = await _apiService.AddTaskAsync(newTask, token);

                if (result)
                {
                    // Only add if the backend successfully returns the task
                    Tasks.Add(newTask);
                    Debug.WriteLine($"✅ Task Added with ID: {newTask.Id}");
                    NewTaskText = string.Empty; // Clear text
                }
                else
                {
                    Debug.WriteLine("❌ Task not added");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Exception: {ex.Message}");
            }
        }
        // Method to delete a task
        private async Task DeleteTask(TaskModel task)
        {
            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("⚠ No auth token found.");
                    return;
                }

                var success = await _apiService.DeleteTaskAsync(task, token);

                if (success)
                {
                    Tasks.Remove(task);
                    Debug.WriteLine($"Task '{task.Text}' deleted successfully.");
                }
                else
                {
                    Debug.WriteLine("❌ Failed to delete task.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to delete task: {ex.Message}");
            }
        }

        private void Logout()
        {
            Preferences.Remove("auth_token");
            Shell.Current.GoToAsync("//LoginPage");
        }
    }
}