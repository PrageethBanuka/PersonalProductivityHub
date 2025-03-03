using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using Microsoft.Maui.Controls;

namespace Focusly.ViewModels
{
    public class BaseViewModel : INotifyPropertyChanged
    {
        
        public event PropertyChangedEventHandler PropertyChanged;

        public ICommand ProfileSettingsCommand { get; }
        public ICommand LogoutCommand { get; }

        public BaseViewModel()
        {
            ProfileSettingsCommand = new Command(async () =>
            {
                await Shell.Current.GoToAsync("//ProfilePage");
            });

            LogoutCommand = new Command(() =>
            {
                Preferences.Remove("auth_token");
                Shell.Current.GoToAsync("//LoginPage");
            });
        }

        protected void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}