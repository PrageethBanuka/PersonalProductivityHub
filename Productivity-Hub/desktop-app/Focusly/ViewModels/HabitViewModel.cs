using Focusly.Models;
using Focusly.Services;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Focusly.ViewModels
{
    public class HabitViewModel : BaseViewModel, INotifyPropertyChanged
    {
        private readonly ApiService _apiService;
        public ObservableCollection<HabitModel> Habits { get; set; } = new();

        private string _newHabitText;
        public string NewHabitText
        {
            get => _newHabitText;
            set
            {
                if (_newHabitText != value)
                {
                    _newHabitText = value;
                    OnPropertyChanged(nameof(NewHabitText)); // Notify that the property has changed
                }
            }
        }
        private int _goalHabitText;
        public int GoalHabitText
        {
            get => _goalHabitText;
            set
            {
                if (_goalHabitText != value)
                {
                    _goalHabitText = value;
                    OnPropertyChanged(nameof(GoalHabitText)); // Notify that the property has changed
                }
            }
        }
        public ICommand LoadHabitsCommand { get; }
        public ICommand AddHabitCommand { get; }
        public ICommand DeleteHabitCommand { get; }

        public ICommand CheckinCommand { get; }

        public HabitViewModel() : this(new ApiService(new HttpClient())) { }

        public HabitViewModel(ApiService apiService)
        {
            _apiService = apiService;
            LoadHabitsCommand = new Command(async () => await LoadHabits());
            AddHabitCommand = new Command(async () => await AddHabit(NewHabitText, GoalHabitText));
            CheckinCommand = new Command<HabitModel>(async (habit) => await Checkin(habit));
            DeleteHabitCommand = new Command<HabitModel>(async (habit) => await DeleteHabit(habit));
        }

        private async Task LoadHabits()
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
                var habits = await _apiService.GetHabitsAsync(token);
                if (habits == null || habits.Count == 0)
                {
                    Debug.WriteLine("⚠ No habits found.");
                    return;
                }
                Habits.Clear();
                foreach (var hab in habits)
                {
                    Habits.Add(hab);
                }
                Debug.WriteLine($"Loaded {habits.Count} habits.");

            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to load habits: {ex.Message}");
            }
            // string token = await SecureStorage.GetAsync("auth_token");
            // if (string.IsNullOrEmpty(token)) return;

            // var habits = await _apiService.GetHabitsAsync(token);
            // Habits.Clear();
            // foreach (var habit in habits)
            //     Habits.Add(habit);
        }

        private async Task AddHabit(string text, int goal)
        {
            if (string.IsNullOrEmpty(text) || goal == 0) return;

            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("��� No auth token found.");
                    return;
                }
                var newHabit = new HabitModel { Text = text, Completed = false, Streak = 0, Goal = goal };
                if (await _apiService.AddHabitAsync(newHabit, token))
                    Habits.Add(newHabit);
                else
                {
                    Debug.WriteLine("�� Failed to add habit.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Exception: {ex.Message}");
            }


        }
        private async Task Checkin(HabitModel habit)
        {
            Debug.WriteLine($"Checkin Button Triggered for {habit.Text}...");

            if (habit == null) return;

            string token = Preferences.Get("auth_token", string.Empty);
            if (string.IsNullOrEmpty(token))
            {
                Debug.WriteLine("❌ No auth token found.");
                return;
            }

            if (habit.Streak < habit.Goal)
            {
                habit.Streak++;
                habit.Completed = habit.Streak >= habit.Goal;

                Debug.WriteLine($"✅ Habit {habit.Text} Streak Updated to {habit.Streak}/{habit.Goal}");

                var result = await _apiService.UpdateHabitAsync(habit, token);

                if (result)
                {
                    var index = Habits.IndexOf(habit);
                    if (index >= 0)
                    {
                        Habits[index] = habit; // Update ObservableCollection
                        OnPropertyChanged(nameof(Habits)); // Force UI Refresh
                    }

                    Debug.WriteLine($"🎯 Checked in for habit '{habit.Text}'.");
                }
                else
                {
                    Debug.WriteLine("❌ Habit Update Failed.");
                }
            }
        }
        private async Task DeleteHabit(HabitModel habit)
        {
            try
            {
                string token = Preferences.Get("auth_token", string.Empty);
                if (string.IsNullOrEmpty(token))
                {
                    Debug.WriteLine("⚠ No auth token found.");
                    return;
                }
                var success = await _apiService.DeleteHabitAsync(habit, token);
                if (success)
                {
                    Habits.Remove(habit);
                    Debug.WriteLine($"Task '{habit.Text}' deleted successfully.");
                }
                else
                {
                    Debug.WriteLine("❌ Failed to delete habit.");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"❌ Failed to delete habit: {ex.Message}");
            }

        }
    }
}