using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScheduleModels.Models
{
    public class PairContainer
    {
        public string TutorName { get; set; }

        public IList<PairModel> Pairs { get; set; }
    }
}
