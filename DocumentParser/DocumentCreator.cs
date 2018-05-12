using DALModels;
using ScheduleModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using Word = Microsoft.Office.Interop.Word;

namespace DocumentWorker
{
    public class DocumentCreator
    {
        private Word._Application Application;
        private Word._Document Document;
        private Word.Table Table;

        Object objMissing;

        public IList<PairContainer> PairsContainer { get; set; }

        public DocumentCreator()
        {
            objMissing = System.Reflection.Missing.Value;
            this.CreateDocument();
        }

        public void CreateTable()
        {
            object endOfDocument = Constants.CreatorConstants.EndOfDoc;

            Word.Range tableLocation = Document.Bookmarks.get_Item(ref endOfDocument).Range;

            Table = Document.Tables.Add(tableLocation,
                Constants.CreatorConstants.CountRow,
                PairsContainer.Count + 2,
                ref objMissing,
                ref objMissing);

            Table.Range.Font.Size = Constants.CreatorConstants.FontSize;

            Table.Borders.InsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
            Table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleEngrave3D;

            Table.AllowAutoFit = true;

            Table.Cell(1, 1).Range.Text = Constants.CreatorConstants.DayHeaderText;
            Table.Cell(1, 2).Range.Text = Constants.CreatorConstants.TimeHeaderText;

            this.InsertData();
        }

        private void CreateDocument()
        {
            Application = new Word.Application
            {
                Visible = true
            };

            Document = Application.Documents.
                Add(ref objMissing, ref objMissing, ref objMissing, ref objMissing);

            Word.Section section = Document.Sections.First;

            section.PageSetup.PageHeight = Constants.CreatorConstants.PageSize;
            section.PageSetup.PageWidth = Constants.CreatorConstants.PageSize;
        }

        private void InsertData()
        {
            string day = string.Empty;

            int countOfSplit = 0;
            int indexOfRowDayCell = 2;

            for (int i = Constants.CreatorConstants.IndexOfStartTutorColumn; i <= Constants.CreatorConstants.CountRow; i++)
            {
                string time = this.InsertTimeInColumn(i, countOfSplit);

                if (((i - 2) % 6) == 0)
                {
                    indexOfRowDayCell = i + countOfSplit;
                    day = this.InsertDayInColumn(indexOfRowDayCell, countOfSplit);
                }
                else
                {
                    Table.Cell(indexOfRowDayCell, Constants.CreatorConstants.DayColumnIndex).
                        Merge(Table.Cell(i + countOfSplit, Constants.CreatorConstants.DayColumnIndex));
                }

                this.InsertPairsForCurrentTime(i, ref countOfSplit, day, time);
            }
        }

        private string InsertDayInColumn(int rowIndex, int countOfSplit)
        {
            Table.Cell(rowIndex, Constants.CreatorConstants.DayColumnIndex).Range.Text = Constants.Days[(rowIndex - countOfSplit - 2) / 6];
            return Constants.Days[(rowIndex - countOfSplit - 2) / Constants.CreatorConstants.CountOfPairsInOneDay];
        }

        private string InsertTimeInColumn(int rowIndex, int countOfSplit)
        {
            Table.Cell(rowIndex + countOfSplit, Constants.CreatorConstants.TimeColumnIndex).Range.Text = 
                Constants.PairTimes[(rowIndex - 2) % Constants.CreatorConstants.CountOfPairsInOneDay].ToString();
            return Constants.PairTimes[(rowIndex - 2) % Constants.CreatorConstants.CountOfPairsInOneDay].ToString();

        }

        private void InsertPairsForCurrentTime(int rowIndex, ref int countOfSplit, string day, string time)
        {
            bool splitInCurrentTime = false;

            for (int j = 0; j < PairsContainer.Count; j++)
            {
                this.InsertTutorName(j);

                var pairs = PairsContainer[j].Pairs.Where(
                        x => x.Day == day &&
                 x.Time.ToString() == time).ToList();

                if (pairs.Count != 0)
                {
                    this.InsertTutorPairsInCurrentTime(pairs, rowIndex, j, ref countOfSplit, ref splitInCurrentTime);
                }
            }
        }

        private void InsertTutorName(int columnIndex)
        {
            Table.Cell(Constants.CreatorConstants.TutorNameRowIndex, columnIndex + 3).Range.Text = PairsContainer[columnIndex].TutorName;
        }

        private void InsertTutorPairsInCurrentTime(List<PairModel> pairs, int rowIndex, int columnIndex, ref int countOfSplit, ref bool splitInCurrentTime)
        {
            if (pairs.Count == 1)
            {
                this.InsertOneTutorPair(pairs[0], rowIndex, columnIndex, ref countOfSplit, ref splitInCurrentTime);
            }
            else
            {
                this.InsertTwoTutorPairs(pairs, rowIndex, columnIndex, ref countOfSplit, ref splitInCurrentTime);
            }
        }

        private void InsertOneTutorPair(PairModel pair, int rowIndex, int columnIndex, ref int countOfSplit, ref bool splitInCurrentTime)
        {
            if (pair.Weekend == Constants.Weekends[0])
            {
                Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Range.Text = pair.ToString();
            }
            else
            {
                if (!splitInCurrentTime)
                {
                    Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Split(Constants.CreatorConstants.SplitNums);
                }
                else
                {
                    Table.Cell(rowIndex + countOfSplit - 1, columnIndex + 3).Split(Constants.CreatorConstants.SplitNums);
                }

                if (pair.Weekend == Constants.Weekends[1])
                {
                    if (!splitInCurrentTime)
                        Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Range.Text = pair.ToString();
                    else
                        Table.Cell(rowIndex + countOfSplit - 1, columnIndex + 3).Range.Text = pair.ToString();
                }
                else
                {
                    if (splitInCurrentTime)
                        Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Range.Text = pair.ToString();
                    else
                        Table.Cell(rowIndex + countOfSplit + 1, columnIndex + 3).Range.Text = pair.ToString();
                }

                if (!splitInCurrentTime)
                {
                    countOfSplit += 1;
                    splitInCurrentTime = true;
                }
            }
        }

        private void InsertTwoTutorPairs(List<PairModel> pairs, int rowIndex, int columnIndex, ref int countOfSplit, ref bool splitInCurrentTime)
        {
            if (!splitInCurrentTime)
            {
                Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Split(Constants.CreatorConstants.SplitNums);
                Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Range.Text = pairs.Where(x => x.Weekend == Constants.Weekends[1]).FirstOrDefault().ToString();
                Table.Cell(rowIndex + countOfSplit + 1, columnIndex + 3).Range.Text = pairs.Where(x => x.Weekend == Constants.Weekends[2]).FirstOrDefault().ToString();
            }
            else
            {
                Table.Cell(rowIndex + countOfSplit - 1, columnIndex + 3).Split(Constants.CreatorConstants.SplitNums);
                Table.Cell(rowIndex + countOfSplit - 1, columnIndex + 3).Range.Text = pairs.Where(x => x.Weekend == Constants.Weekends[1]).FirstOrDefault().ToString();
                Table.Cell(rowIndex + countOfSplit, columnIndex + 3).Range.Text = pairs.Where(x => x.Weekend == Constants.Weekends[2]).FirstOrDefault().ToString();
            }

            if (!splitInCurrentTime)
            {
                countOfSplit += 1;
                splitInCurrentTime = true;
            }
        }
    }
}
