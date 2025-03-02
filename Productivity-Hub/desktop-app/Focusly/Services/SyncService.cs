using Focusly.Services;
using System;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Maui.Storage;
using Microsoft.Maui.Controls;
using Focusly.ViewModels;

namespace Focusly.Services
{
    public class SyncService
    {
        private readonly ApiService _apiService;
        private readonly TaskViewModel _taskViewModel;
        private Timer _syncTimer;

        public SyncService(ApiService apiService, TaskViewModel taskViewModel)
        {
            _apiService = apiService;
            _taskViewModel = taskViewModel;
        }

        // Start the background sync service with a periodic interval (e.g., every 10 seconds)
        public void StartSync()
        {
            _syncTimer = new Timer(async _ => await SyncTasks(), null, TimeSpan.Zero, TimeSpan.FromSeconds(1));
        }

        // Stop the sync service
        public void StopSync()
        {
            _syncTimer?.Change(Timeout.Infinite, 0);
        }

        public async Task SyncTasks()
        {
            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Console.WriteLine("⚠ No auth token found.");
                    return;
                }

                // Fetch tasks from the server
                var tasks = await _apiService.GetTasksAsync(token);
                if (tasks == null || tasks.Count == 0)
                {
                    Console.WriteLine("⚠ No tasks found to sync.");
                    return;
                }

                // Sync tasks with the local ObservableCollection in TaskViewModel
                _taskViewModel.Tasks.Clear();
                foreach (var task in tasks)
                {
                    _taskViewModel.Tasks.Add(task);
                }

                Console.WriteLine($"Successfully synced {tasks.Count} tasks.");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Error syncing tasks: {ex.Message}");
            }
        }
    }
}