using DALModels.DTOModels;
using ScheduleModels.Models;
using System.Linq;

namespace ScheduleModels.Mappers
{
    public class PairMapper
    {
        public PairModel Map(DTOPair pair)
        {
            return new PairModel
            {
                Auditoriums = string.Join<DTOAuditorium>(", ", pair.Auditoriums.ToArray()),
                Groups = string.Join<DTOGroup>(", ", pair.Groups.ToArray()),
                Time = pair.Time.ToString(),
                Day = pair.Day,
                Subject = System.Threading.Thread.CurrentThread.
                          CurrentCulture.TextInfo.ToTitleCase(pair.Subject.ToLower()),
                Type = pair.Type,
                Weekend = pair.Weekend
            };
        }
    }
}
