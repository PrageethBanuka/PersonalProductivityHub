using System;
using System.Globalization;
using Microsoft.Maui.Controls;
using Focusly.Models;

namespace Focusly.Converters
{
    public class StreakToProgressConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is HabitModel habit && habit.Goal > 0)
            {
                return (double)habit.Streak / habit.Goal;
            }
            return 0;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}