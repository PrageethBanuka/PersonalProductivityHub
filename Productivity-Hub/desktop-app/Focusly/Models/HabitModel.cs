namespace Focusly.Models
{
    public class HabitModel
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public bool Completed { get; set; }
        public int Streak { get; set; } = 0;
        public int Goal { get; set; } = 7;
        public DateTime CreatedAt { get; set; }
        public int UserId { get; set; }
        public string StreaktoGoal => $"Streak: {Streak}/{Goal}";
    }
}