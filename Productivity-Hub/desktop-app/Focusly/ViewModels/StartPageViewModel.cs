using Microsoft.Maui.Storage;
using System.Windows.Input;

namespace Focusly.ViewModels
{
    public class StartPageViewModel
    {
        public ICommand GetStartedCommand { get; }
        public ICommand SignInCommand { get; }

        public StartPageViewModel()
        {
            GetStartedCommand = new Command(async () =>
            {
                if (Preferences.ContainsKey("auth_token"))
                {
                    await Shell.Current.GoToAsync("//TaskPage");  // Navigate to TaskPage if authenticated
                }
                else
                {
                    await Shell.Current.GoToAsync("//LoginPage");  // Navigate to LoginPage if not authenticated
                }
            });

            SignInCommand = new Command(async () =>
            {
                // Navigate to the LoginPage within the same window (no new window is opened)
                await Shell.Current.GoToAsync("//LoginPage"); 
            });
        }
    }
}