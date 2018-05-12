using System.Collections.Generic;

namespace ScheduleModels.Models
{
    public class PairContainer
    {
        public string TutorName { get; set; }

        public IList<PairModel> Pairs { get; set; }
    }
}
