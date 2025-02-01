using Focusly.Models;
using Focusly.Services;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Focusly.ViewModels
{
    public class HabitViewModel : BaseViewModel
    {
        private readonly ApiService _apiService;
        public ObservableCollection<HabitModel> Habits { get; set; } = new();

        public ICommand LoadHabitsCommand { get; }
        public ICommand AddHabitCommand { get; }
        
        public HabitViewModel() : this(new ApiService(new HttpClient())) { }

        public HabitViewModel(ApiService apiService)
        {
            _apiService = apiService;
            LoadHabitsCommand = new Command(async () => await LoadHabits());
            AddHabitCommand = new Command<string>(async (habitText) => await AddHabit(habitText));
        }

        private async Task LoadHabits()
        {
            string token = await SecureStorage.GetAsync("auth_token");
            if (string.IsNullOrEmpty(token)) return;

            var habits = await _apiService.GetHabitsAsync(token);
            Habits.Clear();
            foreach (var habit in habits)
                Habits.Add(habit);
        }

        private async Task AddHabit(string text)
        {
            if (string.IsNullOrEmpty(text)) return;

            string token = await SecureStorage.GetAsync("auth_token");
            if (string.IsNullOrEmpty(token)) return;

            var newHabit = new HabitModel { Text = text, Completed = false, Streak = 0, Goal = 7 };
            if (await _apiService.AddHabitAsync(newHabit, token))
                Habits.Add(newHabit);
        }
    }
}