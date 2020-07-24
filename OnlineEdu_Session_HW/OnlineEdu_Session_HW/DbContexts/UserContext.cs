namespace OnlineEdu_Session_HW.DbContexts
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using OnlineEdu_Session_HW.Models;

    public partial class UserContext : DbContext
    {
        public UserContext()
            : base("name=UserContext")
        {
        }

        public DbSet<User> Users { get; set; }
    }
}
