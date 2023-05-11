using System;
using Microsoft.EntityFrameworkCore;

namespace LeerData
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hola Manga de Topus!!!!");
            using(var Db=new AppVentaCursosContext()){
               var cursos=Db.Curso.Include(p=> p.PrecioPromocion).AsNoTracking();
               foreach (var item in cursos)
               {
                   Console.WriteLine(item.Titulo+" "+item.PrecioPromocion.PrecioActual);
               }
            };
              Console.WriteLine("--------------------------------------------------------------------");

             using(var Db=new AppVentaCursosContext()){
               var cursos=Db.Curso.Include(c=> c.ComentarioLista).AsNoTracking();
               foreach (var item in cursos)
               {
                   Console.WriteLine(item.Titulo);
                    foreach (var comentario in item.ComentarioLista)
                    {
                        Console.WriteLine("---------"+comentario.ComentarioTexto);
                    }
               }
            };
            Console.WriteLine("--------------------------------------------------------------------");
            using(var Db=new AppVentaCursosContext()){
               var cursos=Db.Curso.Include(c=>c.InstructorLink).ThenInclude(ci=>ci.Instructor);//con este Query enlazo las tres tablas de muchos a muchos
               foreach (var curso in cursos)
               {
                   Console.WriteLine(curso.Titulo);
                   foreach (var insLink in curso.InstructorLink)
                   {
                       Console.WriteLine("****"+insLink.Instructor.Nombre);
                   }
               }
            };
        }
    }
}
