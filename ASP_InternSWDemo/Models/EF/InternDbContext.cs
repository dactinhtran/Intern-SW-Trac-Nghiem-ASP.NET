namespace Models.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class InternDbContext : DbContext
    {
        public InternDbContext()
            : base("name=InternDbContext")
        {
        }

        public virtual DbSet<AdminUser> AdminUsers { get; set; }
        public virtual DbSet<Answer> Answers { get; set; }
        public virtual DbSet<Ques_Score> Ques_Score { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<Score> Scores { get; set; }
        public virtual DbSet<Topic> Topics { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Credential> Credentials { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdminUser>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<AdminUser>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<AdminUser>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<AdminUser>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Question>()
                .HasMany(e => e.Answers)
                .WithOptional(e => e.Question)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Topic>()
                .HasMany(e => e.Questions)
                .WithOptional(e => e.Topic)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Topic>()
                .HasMany(e => e.Scores)
                .WithOptional(e => e.Topic)
                .WillCascadeOnDelete();

            modelBuilder.Entity<User>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Scores)
                .WithOptional(e => e.User)
                .WillCascadeOnDelete();
        }
    }
}
