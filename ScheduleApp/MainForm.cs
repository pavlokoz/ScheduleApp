using DAL;
using DocumentWorker;
using ScheduleModels.Mappers;
using ScheduleModels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace ScheduleApp
{
    public partial class MainForm : Form
    {
        #region private field
        private DocumentParser parser;
        private DocumentCreator creator;
        private FileRepository fileRepository;
        private PairRepository pairRepository;
        private DevelopRepository developRepository;
        private TutorRepository tutorRepository;
        private PairMapper pairMapper;
        private IList<PairContainer> pairs;
        #endregion

        #region constructor
        public MainForm()
        {
            InitializeComponent();
            fileRepository = new FileRepository();
            pairRepository = new PairRepository();
            developRepository = new DevelopRepository();
            tutorRepository = new TutorRepository();
            pairMapper = new PairMapper();
        }
        #endregion

        #region private methods
        bool IsTheSameCellValue(int column, int row)
        {
            DataGridViewCell cell1 = TutorScheduleViewer[column, row];
            DataGridViewCell cell2 = TutorScheduleViewer[column, row - 1];
            if (cell1.Value == null || cell2.Value == null)
            {
                return false;
            }
            return cell1.Value.ToString() == cell2.Value.ToString();
        }
        #endregion

        #region Button Click Events
        private void LoadButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog.Filter = "Microsoft Word 2007|*.docx|All files (*.*)|*.*";
            OpenFileDialog.FilterIndex = 1;
            OpenFileDialog.RestoreDirectory = true;

            if (OpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                //byte[] fileHash = FileHasher.HashMD5(OpenFileDialog.FileName);

                //if (!fileRepository.CheckFileHash(fileHash) &&
                //    fileRepository.InsertFileHashInDB(OpenFileDialog.FileName, fileHash))
                //{
                Cursor.Current = Cursors.WaitCursor;
                parser = new DocumentParser(OpenFileDialog.FileName);
                parser.ParseDocument();
                pairRepository.InsertPairs(parser.ParseDocument());
                Cursor.Current = Cursors.Arrow;
                //}
                //else
                //{
                //    MessageBox.Show("File already exist in DB", "ScheduleApp");
                //}
            }
        }

        private void CreateButton_Click(object sender, EventArgs e)
        {
            Cursor.Current = Cursors.WaitCursor;

            var tutors = tutorRepository.GetTutors();

            pairs = tutors.Select(x =>
            new PairContainer
            {
                TutorName = x,
                Pairs = tutorRepository.GetPairsForTutor(x).
                        Pairs.Select(pairMapper.Map).ToList()
            }).ToList();

            creator = new DocumentCreator()
            {

                PairsContainer = pairs

            };
            creator.CreateTable();

            Cursor.Current = Cursors.Arrow;
        }

        private void ClearDB_Click(object sender, EventArgs e)
        {
            developRepository.ClearDB();
        }
        #endregion

        #region DataGridFormattingEvents
        private void TutorScheduleViewer_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
        {
            e.AdvancedBorderStyle.Bottom = DataGridViewAdvancedCellBorderStyle.None;
            if (e.RowIndex < 1 || e.ColumnIndex < 0)
                return;
            if (IsTheSameCellValue(e.ColumnIndex, e.RowIndex))
            {
                e.AdvancedBorderStyle.Top = DataGridViewAdvancedCellBorderStyle.None;
            }
            else
            {
                e.AdvancedBorderStyle.Top = TutorScheduleViewer.AdvancedCellBorderStyle.Top;
            }
        }

        private void TutorScheduleViewer_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (e.RowIndex == 0)
                return;
            if (IsTheSameCellValue(e.ColumnIndex, e.RowIndex))
            {
                e.Value = "";
                e.FormattingApplied = true;
            }
        }
        #endregion
    }
}
