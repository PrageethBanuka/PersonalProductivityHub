using Microsoft.EntityFrameworkCore;
using Focusly.Models;

namespace Focusly.Services
{
    public class DatabaseService : DbContext
    {
        public DbSet<TaskModel> Tasks { get; set; }
        public DbSet<HabitModel> Habits { get; set; }

        public DatabaseService(DbContextOptions<DatabaseService> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TaskModel>().Property(t => t.Completed).HasDefaultValue(false);
            modelBuilder.Entity<HabitModel>().Property(h => h.Streak).HasDefaultValue(0);
        }
    }
}