using Focusly.ViewModels;
using CommunityToolkit.Maui.Views;

namespace Focusly.Views;

public partial class TaskPage : ContentPage
{
    public TaskPage()
    {
        InitializeComponent();
        BindingContext = new TaskViewModel(); // Set ViewModel as the BindingContext
    }

    protected override void OnAppearing()
    {
        base.OnAppearing();

        // Load tasks when the page appears
        var viewModel = (TaskViewModel)BindingContext;
        viewModel.LoadTasksCommand.Execute(null); // Execute LoadTasksCommand to fetch tasks
    }
}