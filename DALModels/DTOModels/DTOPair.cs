using System.Collections.Generic;

namespace DALModels.DTOModels
{
    public class DTOPair
    {
        public IList<DTOGroup> Groups { get; set; } 

        public IList<DTOAuditorium> Auditoriums { get; set; }

        public string Subject { get; set; }

        public string Day { get; set; }

        public string Weekend { get; set; }

        public DTOTime Time { get; set; }

        public string Type { get; set; }
    }
}
