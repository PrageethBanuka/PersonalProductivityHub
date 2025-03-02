using Microsoft.Maui.Controls;
using Focusly.Services;
using Focusly.ViewModels;

namespace Focusly;

public partial class App : Application
{
    private SyncService SyncService;
    public App()
    {

        InitializeComponent();
        var apiService = new ApiService(new HttpClient());
        var taskViewModel = new TaskViewModel(apiService);
        SyncService = new SyncService(apiService, taskViewModel);
        MainPage = new AppShell();
    }
    protected override void OnStart()
        {
            base.OnStart();
            SyncService.StartSync(); // Start syncing tasks when the app starts
        }

        protected override void OnSleep()
        {
            base.OnSleep();
            SyncService.StopSync(); // Stop syncing tasks when the app is in the background
        }
}