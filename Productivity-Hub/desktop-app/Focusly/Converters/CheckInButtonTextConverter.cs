using System.Globalization;
using Microsoft.Maui.Controls;

namespace Focusly.Converters;

public class CheckInButtonTextConverter : IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
    {
        if (value is bool completed && completed)
            return "Succeed!";

        return "Check In";
    }

    public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}