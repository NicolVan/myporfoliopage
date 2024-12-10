using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NikolaVan.lib.Models
{
    public class EducationModel
    {
        public Courses Namecourses { get; set; }
        public string HightSchool;
        public string University;

        public EducationModel()
        {
            Namecourses = new Courses();
        }
    }
}