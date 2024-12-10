using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NikolaVan.lib.Models
{
    public class Courses
    {
        public List<string> nameCourse { get; set; }

        public Courses()
        {
            nameCourse = new List<string>
            {
                "Kurz HTML",
                "Kurz Css",
                "Kurz C#",
                "Kurz  Javascript",
                "Kurz  Umbraco",
                "Kurz  Bootstrap"
            };
        }
    }
}

