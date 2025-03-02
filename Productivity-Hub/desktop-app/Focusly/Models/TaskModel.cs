namespace Focusly.Models
{
    public class TaskModel
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public bool Completed { get; set; }
        public DateTime? Timer { get; set; }
        public string RemainingTime => Timer.HasValue
    ? (Timer.Value - DateTime.UtcNow).TotalSeconds > 0 ? (Timer.Value - DateTime.UtcNow).ToString("hh\\:mm\\:ss") : "Times Up!"
    : " ";
        public DateTime CreatedAt { get; set; }
    }
}