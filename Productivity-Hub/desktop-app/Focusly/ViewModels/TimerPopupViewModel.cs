// using Focusly.Models;
// using System;
// using System.Windows.Input;
// using Microsoft.Maui.Controls;

// namespace Focusly.ViewModels
// {
//     public class TimerPopupViewModel : BindableObject
//     {
//         // The SelectedDateTime is a combination of Date and Time
//         private DateTime _selectedDateTime;
//         public DateTime SelectedDateTime
//         {
//             get => _selectedDateTime;
//             set
//             {
//                 if (_selectedDateTime != value)
//                 {
//                     _selectedDateTime = value;
//                     OnPropertyChanged();
//                 }
//             }
//         }

//         // Task to which the timer is being set
//         public TaskModel Task { get; set; }

//         // Command to set the timer
//         public ICommand SetTimerCommand { get; }

//         public TimerPopupViewModel(TaskModel task)
//         {
//             Task = task;
//             SetTimerCommand = new Command(OnSetTimer);
//         }

//         // When the Set Timer button is clicked, this method is triggered
//         private void OnSetTimer()
//         {
//             // Update the task's Timer property with the selected date and time
//             Task.Timer = SelectedDateTime;

//             // Notify that the RemainingTime should be updated
//             OnPropertyChanged(nameof(Task.RemainingTime));

//             // You can now close the popup or do any other necessary logic
//             // For example, navigate back to the previous page
//             // Application.Current.MainPage.Navigation.PopAsync();
//         }
//     }
// }