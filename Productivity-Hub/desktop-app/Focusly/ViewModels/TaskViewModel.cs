using Focusly.Models;
using Focusly.Services;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Storage;
using System.Diagnostics;

namespace Focusly.ViewModels
{
    public class TaskViewModel : BaseViewModel
    {
        private readonly ApiService _apiService;
        public ObservableCollection<TaskModel> Tasks { get; set; } = new();

        public ICommand LoadTasksCommand { get; }
        public ICommand AddTaskCommand { get; }
        public ICommand LogoutCommand { get; }

        public TaskViewModel() : this(new ApiService(new HttpClient())) { }

        public TaskViewModel(ApiService apiService)
        {
            _apiService = apiService;
            LoadTasksCommand = new Command(async () => await LoadTasks());
            AddTaskCommand = new Command<string>(async (taskText) => await AddTask(taskText));
            LogoutCommand = new Command(Logout);
        }

        private async Task LoadTasks()
        {
            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("⚠ No auth token found.");
                    return;
                }

                var tasks = await _apiService.GetTasksAsync(token);
                Tasks.Clear();
                foreach (var task in tasks)
                    Tasks.Add(task);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to load tasks: {ex.Message}");
            }
        }

        private async Task AddTask(string text)
        {
            if (string.IsNullOrEmpty(text)) return;

            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token)) return;

                var newTask = new TaskModel { Text = text, Completed = false, CreatedAt = DateTime.UtcNow };
                if (await _apiService.AddTaskAsync(newTask, token))
                    Tasks.Add(newTask);
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to add task: {ex.Message}");
            }
        }

        private void Logout()
        {
            Preferences.Remove("auth_token");
            Shell.Current.GoToAsync("//LoginPage");
        }
    }
}