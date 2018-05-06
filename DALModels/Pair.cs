using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DALModels
{
    public class Pair
    {
        public IList<Auditorium> Auditoriums { get; set; }

        public IList<Group> Groups { get; set; }

        public IList<Tutor> Tutors { get; set; }

        public string DayName { get; set; }

        public string SubjectName { get; set; }

        public string TypeName { get; set; }

        public string WeekendName { get; set; }

        public PairTime Time { get; set; }
    }
}
