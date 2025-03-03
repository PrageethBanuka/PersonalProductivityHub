using CommunityToolkit.Maui.Views;
using Focusly.Models;
using Focusly.Services;
using Focusly.ViewModels;

namespace Focusly.Views;


public partial class TimerPopup : Popup
{
    public readonly TaskViewModel _taskViewModel;
    public TimerPopup(TaskModel task, ApiService apiService)
    {
        InitializeComponent();
        BindingContext = new TimerPopupViewModel(task,apiService,_taskViewModel);
       
    }

    private void ClosePopup(object sender, EventArgs e)
    {
        Close();
    }
}