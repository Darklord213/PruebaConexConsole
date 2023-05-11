using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
    public class AppVentaCursosContext : DbContext
    {
        private const string connectionString=@"Data Source=NOTEWIN10\SQLEXPRESS;Initial Catalog=CursoOnline;User ID=sa;Password=adri;TrustServerCertificate=True";
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
           optionsBuilder.UseSqlServer(connectionString); 

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder){
            modelBuilder.Entity<CursoInstructor>().HasKey(ci=>new {ci.CursoID,ci.InstructorID});
        }
        public DbSet<Curso> Curso {get;set;}
        public DbSet<Precio> Precio {get; set;}
        public DbSet<Comentario> Comentario {get; set;}
        public DbSet<Instructor> Instructor {get; set;}
        public DbSet<CursoInstructor> CursoInstructor {get; set;}
        
    }
}