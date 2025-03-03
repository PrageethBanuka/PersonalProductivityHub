using Focusly.Services;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.Maui.Storage;
using Focusly.Models;
using System.Diagnostics;

namespace Focusly.ViewModels
{
    public class LoginViewModel : BaseViewModel
    {
        private readonly AuthService _authService;
        private string _email;
        private string _password;
        private string _errorMessage;

        public string Email
        {
            get => _email;
            set
            {
                _email = value;
                OnPropertyChanged();
            }
        }

        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged();
            }
        }

        public string ErrorMessage
        {
            get => _errorMessage;
            set
            {
                _errorMessage = value;
                OnPropertyChanged();
            }
        }

        public ICommand LoginCommand { get; }
        public ICommand SignUpCommand { get; }

        public LoginViewModel()
        {
            _authService = new AuthService(new HttpClient());
            LoginCommand = new Command(async () => await Login());
            SignUpCommand = new Command(OpenSignUpWindow);
        }

        private async Task Login()
        {
            try
            {
                ErrorMessage = ""; // Clear previous errors
                var response = await _authService.LoginAsync(Email, Password);

                if (!string.IsNullOrEmpty(response))
                {
                    Preferences.Set("auth_token", response);
                    Debug.WriteLine("✅ Login Successful!");

                    // Close the Login Window
                    CloseLoginWindow();

                    // Navigate to TaskPage
                    await Shell.Current.GoToAsync("//TaskPage");
                }
                else
                {
                    ErrorMessage = "Invalid email or password. Please try again.";
                }
            }
            catch (Exception ex)
            {
                ErrorMessage = "Login failed. Please check your connection.";
                Debug.WriteLine($"❌ Login Error: {ex.Message}");
            }
        }

        private void OpenSignUpWindow()
        {
            var window = new Window(new Views.SignUpPage());
            Application.Current.OpenWindow(window);
        }

        private void CloseLoginWindow()
        {
            var currentWindow = Application.Current.Windows.FirstOrDefault(w => w.Page is Views.LoginPage);
            if (currentWindow != null)
            {
                currentWindow.Handler?.DisconnectHandler(); // ✅ This is how we close the window
            }
        }
    }
}