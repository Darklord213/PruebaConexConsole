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
        private const string connectionString=@"Data Source=DESKTOP-VB1LM5D\SQLEXPRESS;Initial Catalog=CursoOnline;User ID=sa;Password=stock1234;TrustServerCertificate=True";
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder){
           optionsBuilder.UseSqlServer(connectionString); 

        }
        public DbSet<Curso> Curso {get;set;}
        public DbSet<Precio> Precio {get; set;}
        public DbSet<Comentario> Comentario {get; set;}
        
    }
}