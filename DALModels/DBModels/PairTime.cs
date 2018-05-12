using System;

namespace DALModels.DBModels
{
    public class PairTime
    {
        public TimeSpan StartTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public override string ToString()
        {
            return StartTime.ToString(Constants.ParserConstants.TimeFormat) + '-' +
                EndTime.ToString(Constants.ParserConstants.TimeFormat);
        }
    }
}
