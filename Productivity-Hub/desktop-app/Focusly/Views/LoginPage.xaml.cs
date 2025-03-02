using Focusly.ViewModels;
using Microsoft.Maui.Controls;

namespace Focusly.Views
{
    public partial class LoginPage : ContentPage
    {
        public LoginPage()
        {
            InitializeComponent();
            BindingContext = new LoginViewModel();
        }
    }
}
