using Focusly.ViewModels;

namespace Focusly.Views;

public partial class StartPage : ContentPage
{
	public StartPage()
	{
		InitializeComponent();
		BindingContext = new StartPageViewModel();
	}
}