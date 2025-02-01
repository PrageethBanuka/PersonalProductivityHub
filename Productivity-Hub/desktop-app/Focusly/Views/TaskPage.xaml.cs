using Focusly.ViewModels;

namespace Focusly.Views;

public partial class TaskPage : ContentPage
{
    public TaskPage()
    {
        InitializeComponent();
        BindingContext = new TaskViewModel();
        
    }
}