using System.ComponentModel;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Controls;
using Focusly.Views;  // For Device.BeginInvokeOnMainThread

namespace Focusly.ViewModels
{
    public class PomodoroViewModel : INotifyPropertyChanged
    {
        private int _seconds = 1500; // 25 minutes
        private bool _isRunning;
        private bool _isBreakTime;
        private int _breakSeconds = 300; // 5 minutes break
        private bool _isBreakVisible;

        public string TimerText => $"{_seconds / 60:D2}:{_seconds % 60:D2}";
        public string BreakText => $"{_breakSeconds / 60:D2}:{_breakSeconds % 60:D2}";

        public ICommand StartCommand { get; }
        public ICommand StopCommand { get; }
        public ICommand StartBreakCommand { get; }
        public ICommand CancelBreakCommand { get; }

        public bool IsBreakVisible
        {
            get => _isBreakVisible;
            set
            {
                _isBreakVisible = value;
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(IsBreakVisible)));
            }
        }

        public PomodoroPage PomodoroPageInstance { get; set; }  // Property to hold the PomodoroPage reference

        public event PropertyChangedEventHandler PropertyChanged;

        public PomodoroViewModel()
        {
            StartCommand = new Command(StartTimer);
            StopCommand = new Command(StopTimer);
            StartBreakCommand = new Command(StartBreak, CanStartBreak);  // Added CanStartBreak method for command enablement
            CancelBreakCommand = new Command(CancelBreak);
        }

        // Start Pomodoro Timer
        private async void StartTimer()
        {
            _isRunning = true;
            while (_isRunning && _seconds > 0)
            {
                await Task.Delay(1000);
                _seconds--;
                // Update the TimerText
                Device.BeginInvokeOnMainThread(() =>
                {
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(TimerText)));
                });
            }

            if (_seconds == 0 && !_isBreakTime)
            {
                // Once the Pomodoro session ends, start the break
                PomodoroPageInstance?.FadeOutTimer();  // Call FadeOutTimer method of the PomodoroPage
                StartBreak(null);  // Trigger the break directly
            }
        }

        // Stop Timer
        private void StopTimer()
        {
            _isRunning = false;
        }

        // Start Break
        private async void StartBreak(object parameter)
        {
            _isBreakTime = true;
            IsBreakVisible = true;
            _breakSeconds = 300; // Reset to 5 minutes break

            // Decrement break seconds
            while (_isRunning && _breakSeconds > 0)
            {
                await Task.Delay(1000);
                _breakSeconds--;
                // Update the BreakText
                Device.BeginInvokeOnMainThread(() =>
                {
                    PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(BreakText)));
                });
            }

            if (_breakSeconds == 0)
            {
                // Break ends, reset the timer
                _isBreakTime = false;
                IsBreakVisible = false;
                _seconds = 1500; // Reset to 25 minutes
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(TimerText)));
            }
        }

        // This method controls whether the command can be executed
        private bool CanStartBreak(object parameter)
        {
            return !_isBreakTime;  // Only allow starting the break if it's not already break time
        }

        // Cancel Break
        private void CancelBreak()
        {
            // Stop the break and reset everything
            _isRunning = false;
            _isBreakTime = false;
            IsBreakVisible = false;
            _seconds = 1500; // Reset to 25 minutes
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(nameof(TimerText)));
        }
    }
}