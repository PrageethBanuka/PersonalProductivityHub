using System.ComponentModel;
using System.Runtime.CompilerServices;
using Focusly.Models;
using Microsoft.Maui.Storage;
using System.Windows.Input;
using Microsoft.Maui.Controls;

namespace Focusly.ViewModels
{
    public class AppShellViewModel : INotifyPropertyChanged
    {
        public ICommand NavigatePomodoroCommand { get; }

       
            // Initialize the command
            
        
        private string _avatar;
        private string _name;

        public string Avatar
        {
            get => _avatar;
            set
            {
                if (_avatar != value)
                {
                    _avatar = value;
                    OnPropertyChanged();
                }
            }
        }

        public string Name
        {
            get => _name;
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged();
                }
            }
        }

        public Command ProfileSettingsCommand { get; }
        public Command LogoutCommand { get; }

        public AppShellViewModel()
        {
            NavigatePomodoroCommand = new Command(async () =>
            {
                await Shell.Current.GoToAsync("PomodoroPage");
            });
            ProfileSettingsCommand = new Command(async () =>
            {
                await Shell.Current.GoToAsync("//ProfilePage");
            });

            LogoutCommand = new Command(() =>
            {
                Preferences.Remove("auth_token");
                Shell.Current.GoToAsync("//LoginPage");
            });

            LoadUserData();
        }

        private void LoadUserData()
        {
            // Load user data from preferences (or other sources)
            Name = Preferences.Get("user_name", "Guest");
            Avatar = Preferences.Get("user_avatar", "http://localhost:3000/images/user.png");
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}