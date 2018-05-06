using System.Collections.Generic;
using System.Collections.ObjectModel;
using System;

namespace DALModels
{
    public static class Constants
    {
        public static readonly IList<string> Days = new ReadOnlyCollection<string>(
            new List<string> { "Понеділок",
                               "Вівторок",
                               "Середа",
                               "Чертвер",
                               "П'ятниця",
                               "Субота",
                               "Неділя"
                             });

        public static readonly IList<string> Weekends = new ReadOnlyCollection<string>(
            new List<string> { "Обидва", "Чисельник", "Знаменник" });

        public static readonly IList<string> Types = new ReadOnlyCollection<string>(
            new List<string> { "Лекція", "Лаболаторна" });

        public static readonly IList<PairTime> PairTimes = new ReadOnlyCollection<PairTime>(
            new List<PairTime> { new PairTime() { StartTime = new TimeSpan(8, 30, 0), EndTime = new TimeSpan(9, 50, 0)},
                                 new PairTime() { StartTime = new TimeSpan(10, 10, 0), EndTime = new TimeSpan(11, 30, 0)},
                                 new PairTime() { StartTime = new TimeSpan(11, 50, 0), EndTime = new TimeSpan(13, 10, 0)},
                                 new PairTime() { StartTime = new TimeSpan(13, 30, 0), EndTime = new TimeSpan(14, 50, 0)},
                                 new PairTime() { StartTime = new TimeSpan(15, 05, 0), EndTime = new TimeSpan(16, 25, 0)},
                                 new PairTime() { StartTime = new TimeSpan(16, 40, 0), EndTime = new TimeSpan(18, 00, 0)}
            });
        public static class ParserConstants
        {
            public const int startColumnIndex = 3;
            public const int startRowIndex = 2;
            public const int maxCountOfRows = 60;
            public const int TypeLength = 3;
            public const int GroupNameRowIndex = 1;
            public const int GroupNameLength = 6;
            public const int MaxGroupsCountInSpeciality = 5;
            public const char StartCharOfGroupName = 'П';
            public const int CountOfSkipElementForAuditorium = 2;
            public const char AuditoriumSpliter = ',';
            public const int MinTutorNameLength = 6;
            public const int TutorInitialsLength = 5;
            public const int TutorNameSkipLength = 7;
            public const int TimeLength = 5;
            public const int TimeColumnIndex = 2;
            public const string TimeFormat = "hh\\:mm";
            public const int StartTimeSubstringIndex = 1;
            public const int EndTimeSubStringIndex = 5;
            public const int DayColumnIndex = 1;
            public const int CountOfSkipElementForDay = 2;
        }
    }
}
