using CommunityToolkit.Maui.Views;

namespace Focusly.Views;

public partial class TimerPopup : Popup
{
    public TimerPopup()
    {
        InitializeComponent();
    }

    private void ClosePopup(object sender, EventArgs e)
    {
        Close();
    }
}