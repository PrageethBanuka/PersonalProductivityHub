using Focusly.Services;
using Focusly.ViewModels;

namespace Focusly.Views;

public partial class HabitPage : ContentPage
{
	public HabitPage()
	{
		InitializeComponent();
		BindingContext = new HabitViewModel();
	}
	protected override void OnAppearing(){
		base.OnAppearing();
		((HabitViewModel)BindingContext).LoadHabitsCommand.Execute(null);
	}


}