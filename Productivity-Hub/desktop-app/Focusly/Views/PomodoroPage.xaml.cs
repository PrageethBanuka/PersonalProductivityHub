using Focusly.ViewModels;

namespace Focusly.Views
{
    public partial class PomodoroPage : ContentPage
    {
        public PomodoroPage()
        {
            InitializeComponent();
            var viewModel = new PomodoroViewModel();
            BindingContext = viewModel;

            // Pass the current page instance to the ViewModel
            viewModel.PomodoroPageInstance = this;  
        }

        public async void FadeOutTimer()
        {
            // Handle the FadeOut animation
            await TimerLabel.FadeTo(0.5, 1000);  // Fade to 50% opacity in 1 second
        }

        public async void FadeInTimer()
        {
            // Handle the FadeIn animation
            await TimerLabel.FadeTo(1, 1000);  // Fade to 100% opacity in 1 second
        }
		public void PlayTimerEndSound()
        {
            // Ensure the sound is played after the timer finishes
            // TimerEndSound.Play();
        }
    }
}