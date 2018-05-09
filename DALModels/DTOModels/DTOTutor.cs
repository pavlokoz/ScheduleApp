using System.Collections.Generic;

namespace DALModels.DTOModels
{
    public class DTOTutor
    {
        public string TutorName { get; set; }

        public IList<DTOPair> Pairs { get; set; }
    }
}
