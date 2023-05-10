using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LeerData
{
    public class CursoInstructor
    {
        public int InstructorID {get; set;}
        public Instructor Instructor {get; set;}
        public int CursoID {get;set;}
        public Curso Curso {get; set;}
    }
}