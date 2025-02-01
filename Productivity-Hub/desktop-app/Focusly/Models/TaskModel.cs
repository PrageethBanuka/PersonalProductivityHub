namespace Focusly.Models
{
    public class TaskModel
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public bool Completed { get; set; }
        public DateTime? Timer { get; set; }
        public DateTime CreatedAt { get; set; }
        public int UserId { get; set; }
    }
}