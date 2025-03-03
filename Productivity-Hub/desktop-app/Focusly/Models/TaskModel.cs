using System.ComponentModel;

namespace Focusly.Models
{
    public class TaskModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        private bool _completed;
        public bool Completed
        {
            get => _completed;
            set
            {
                if (_completed != value)
                {
                    _completed = value;
                    OnPropertyChanged(nameof(Completed));
                }
            }
        }

        public int Id { get; set; }
        public string Text { get; set; }
        public DateTime? Timer { get; set; }
        public string RemainingTime
        {
            get
            {
                if (Timer.HasValue)
                {
                    var remainingTime = Timer.Value - DateTime.UtcNow;
                    if (remainingTime.TotalSeconds > 0)
                    {
                        return remainingTime.ToString("hh\\:mm");
                    }
                    else
                    {
                        return "Times Up!";
                    }
                }
                return " ";
            }
        }
        public DateTime CreatedAt { get; set; }
    }
}