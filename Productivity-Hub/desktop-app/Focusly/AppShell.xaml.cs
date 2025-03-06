using Focusly.ViewModels;

namespace Focusly;

public partial class AppShell : Shell
{
    public AppShell()
    {
        InitializeComponent(); // This will only work if the XAML is linked properly
        BindingContext = new AppShellViewModel(); // ViewModel assigned here
    }
   
}