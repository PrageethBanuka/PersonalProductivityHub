using Focusly.Models;
using Focusly.Services;
using System;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using System.Diagnostics;
using Newtonsoft.Json;

namespace Focusly.ViewModels
{
    public class TimerPopupViewModel : BindableObject
    {
        private readonly ApiService _apiService;
        private readonly TaskViewModel _taskViewModel; // Add reference to TaskViewModel

        private DateTime _minDate = DateTime.Today;

        public DateTime MinDate
        {
            get => _minDate;
            set
            {
                if (_minDate != value)
                {
                    _minDate = value;
                    OnPropertyChanged();
                }
            }
        }
        
        private DateTime _selectedDateTime;
        public DateTime SelectedDateTime
        {
            get => _selectedDateTime;
            set
            {
                if (_selectedDateTime.Date != value.Date)
                {
                    _selectedDateTime = value;
                    OnPropertyChanged();
                }
            }
        }

        private TimeSpan _selectedTime;
        public TimeSpan SelectedTime
        {
            get => _selectedDateTime.TimeOfDay;
            set
            {
                if (_selectedTime != value)
                {
                    _selectedTime = value;
                    _selectedDateTime = SelectedDateTime.Date + _selectedTime; // Combine Date and Time
                    OnPropertyChanged(nameof(SelectedDateTime)); // Notify change in SelectedDateTime
                }
            }
        }

        public TaskModel Task { get; set; }
        public ICommand SetTimerCommand { get; }

        public TimerPopupViewModel(TaskModel task, ApiService apiService, TaskViewModel taskViewModel)
        {
            Task = task;
            _apiService = apiService;
            _taskViewModel = taskViewModel; // Initialize the TaskViewModel reference
            SetTimerCommand = new Command(OnSetTimer);
        }

        private async void OnSetTimer()
        {
            if (Task == null)
            {
                Debug.WriteLine("⚠ Task is null, cannot set timer.");
                return;
            }

            string timerString = SelectedDateTime.ToString("o"); // Format the DateTime as ISO-8601

            if (DateTime.TryParse(timerString, out DateTime parsedDateTime))
            {
                Task.Timer = parsedDateTime.ToUniversalTime(); // Convert to UTC before assigning
            }
            else
            {
                Debug.WriteLine("❌ Invalid DateTime format.");
            }

            OnPropertyChanged(nameof(Task.Timer));

            string token = Preferences.Get("auth_token", string.Empty);
            if (string.IsNullOrEmpty(token))
            {
                Debug.WriteLine("⚠ No auth token found.");
                return;
            }

            var success = await _apiService.UpdateTaskAsync(Task, token);

            if (success)
            {
                Debug.WriteLine($"✅ Timer updated successfully for Task: {Task.Text}");

                // Trigger task refresh in TaskViewModel
                _taskViewModel.RefreshTasks(); // Call RefreshTasks to reload tasks
            }
            else
            {
                Debug.WriteLine("❌ Failed to update timer");
            }
        }
    }
}