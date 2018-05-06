using DALModels;
using System;
using System.Collections.Generic;
using System.Linq;
using Word = Microsoft.Office.Interop.Word;

namespace DocumentParser
{
    public class Parser
    {
        private Word.Application Application;
        private Word.Document Document;

        public Word.Table Table { get; set; }

        public Parser(string PathObj)
        {
            Object templatePathObj = PathObj;
            Application = new Word.Application();

            try
            {
                Document = Application.Documents.Add(ref templatePathObj);
                Table = Document.Tables[1];
            }

            catch (Exception)
            {
                Document = null;
                Table = null;
            }
        }

        public IList<Pair> ParseDocument()
        {
            IList<Pair> pairs = new List<Pair>();

            int endIndex = Table.Columns.Count;
    
            for (int i = Constants.ParserConstants.startColumnIndex; i <= endIndex; i++)
            {
                for (int j = Constants.ParserConstants.startRowIndex; j < Constants.ParserConstants.maxCountOfRows; j++)
                {
                     try
                    {
                        if (Table.Cell(j, i).Range.Text.Length > 5)
                        {
                            pairs.Add(GetInfoAboutPair(Table.Cell(j, i).Range.Text, j, i));
                        }
                    }
                    catch
                    {

                    }
                }
            }

            return pairs;
        }

        private Pair GetInfoAboutPair(string MyInfo, int rowIndex, int columnIndex)
        {
            string[] Info = MyInfo.Split(Environment.NewLine.ToCharArray());

            Pair pair = new Pair
            {
                SubjectName = Info[0],

                TypeName = this.GetType(Info[1].Substring(1, Constants.ParserConstants.TypeLength).ToLower()),

                Auditoriums = this.GetAuditoriums(
                Info[1].Substring(Info[1].IndexOf(' ') + 1,
                                  Info[1].IndexOf(' ', Info[1].IndexOf(' ') + 1) -
                                  Info[1].IndexOf(' ') - Constants.ParserConstants.CountOfSkipElementForAuditorium
                                  )),

                Tutors = this.GetTutors(Info[1].Substring(Info[1].IndexOf(' ', Info[1].IndexOf(' ') + 1))),

                WeekendName = this.GetWeekend(rowIndex, columnIndex),

                Time = this.GetPairTime(rowIndex),

                DayName = GetDay(rowIndex)
            };

            pair.Groups = this.GetGroups(pair.TypeName, rowIndex, columnIndex);

            return pair;
        }

        private string GetType(string type)
        {
            if (type.Contains(Constants.Types[1].Substring(0, Constants.ParserConstants.TypeLength).ToLower()))
            {
                return Constants.Types[1];
            }

            else if (type.ToLower().Contains(Constants.Types[0].Substring(0, Constants.ParserConstants.TypeLength).ToLower()))
            {
                 return Constants.Types[0];
            }

            //Must never call
            return string.Empty;
        }

        private IList<Group> GetGroups(string pairType, int rowIndex, int columnIndex)
        {
            List<Group> GroupNames = new List<Group>();

            string groupName = Table.Cell(Constants.ParserConstants.GroupNameRowIndex, columnIndex).Range.Text;

            groupName = groupName[0] != Constants.ParserConstants.StartCharOfGroupName ?
                groupName.Substring(groupName.IndexOf(Constants.ParserConstants.StartCharOfGroupName)) :
                groupName;

            GroupNames.Add(new Group()
                { GroupName = groupName.Substring(0, Constants.ParserConstants.GroupNameLength) });

            if (pairType == Constants.Types[0])
            {
                for (int i = columnIndex + 1; i < Constants.ParserConstants.MaxGroupsCountInSpeciality; i++)
                {
                    try
                    {
                        Table.Cell(rowIndex, i);
                        break;
                    }
                    catch
                    {
                        GroupNames.Add(
                            new Group() { GroupName = Table.Cell(Constants.ParserConstants.GroupNameRowIndex, i).Range.Text.Substring(1, Constants.ParserConstants.GroupNameLength) }
                            );
                    }
                }
            }

            return GroupNames;
        }

        private IList<Auditorium> GetAuditoriums(string auditoria)
        {
            IList<Auditorium> auditoriums = new List<Auditorium>();
            auditoria.Split(Constants.ParserConstants.AuditoriumSpliter).ToList().ForEach(x => auditoriums.Add(new Auditorium() { AuditoriumName = x }));
            return auditoriums;
        }

        private IList<Tutor> GetTutors(string tutors)
        {
            IList<Tutor> Tutors = new List<Tutor>();

            while (tutors.Length > Constants.ParserConstants.MinTutorNameLength)
            {
                string TutorName = "";
                tutors = tutors.Substring(tutors.IndexOf(' ', 1) + 1);
                TutorName += tutors.Substring(0, tutors.IndexOf(' ') + 1);
                tutors = tutors.Substring(tutors.IndexOf(' ') + 1);
                TutorName += tutors.Substring(0, Constants.ParserConstants.TutorInitialsLength);
                Tutors.Add(new Tutor() { TutorName = TutorName });
                try
                {
                    tutors = tutors.Substring(Constants.ParserConstants.TutorNameSkipLength);
                }
                catch
                {
                    break;
                }
            }

            return Tutors;
        }

        private string GetWeekend(int rowIndex, int columnIndex)
        {
            string weekend = Constants.Weekends[0];
            try
            {
                Table.Cell(rowIndex, Constants.ParserConstants.TimeColumnIndex);
            }
            catch
            {
                weekend = Constants.Weekends[2];
            }

            try
            {
                Table.Cell(rowIndex + 1, columnIndex);
                Table.Cell(rowIndex + 1, Constants.ParserConstants.TimeColumnIndex);
            }
            catch
            {
                weekend = Constants.Weekends[1];
            }

            if (weekend == Constants.Weekends[1])
            {
                try
                {
                    Table.Cell(rowIndex + 1, columnIndex);

                }
                catch
                {
                    weekend = Constants.Weekends[0];
                }
            }

            return weekend;
        }

        private PairTime GetPairTime(int rowIndex)
        {
            try
            {
                return this.GetTime(rowIndex);
            }
            catch (Exception)
            {
                try
                {
                    return this.GetTime(rowIndex - 1);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        private PairTime GetTime(int rowIndex)
        {
            string startTime = Table.Cell(rowIndex, Constants.ParserConstants.TimeColumnIndex).Range.Text.Substring(1, Constants.ParserConstants.TimeLength) == "8:30-" ?
                                   "08:30" :
                                   Table.Cell(rowIndex, Constants.ParserConstants.TimeColumnIndex).Range.Text.Substring(1, Constants.ParserConstants.TimeLength);

            for (int i = 0; i < Constants.PairTimes.Count; i++)
            {
                if (startTime == (Constants.PairTimes[i].StartTime.ToString(Constants.ParserConstants.TimeFormat)))
                {
                    return Constants.PairTimes[i];
                }
            }
            throw new ArgumentException("Invalid time for pair");
        }

        private string GetDay(int rowIndex)
        {
            int k = rowIndex;
            while (k > 0)
            {
                try
                {
                    return Table.Cell(k, Constants.ParserConstants.DayColumnIndex).Range.Text.
                        Substring(0, Table.Cell(k, Constants.ParserConstants.DayColumnIndex).Range.Text.Length - Constants.ParserConstants.CountOfSkipElementForDay);
                }
                catch
                {
                    k--;
                }
            }

            throw new ArgumentException("InvalidTypeOfDocument");
        }
    }
}
