using DAL;
using DocumentParser;
using ScheduleModels.Mappers;
using System;
using System.Linq;
using System.Windows.Forms;

namespace ScheduleApp
{
    public partial class MainForm : Form
    {
        #region private field
        private Parser parser;
        private FileRepository fileRepository;
        private PairRepository pairRepository;
        private DevelopRepository developRepository;
        private TutorRepository tutorRepository;
        private PairMapper pairMapper;
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

        #region ButtonClickEvents
        private void LoadButton_Click(object sender, EventArgs e)
        {
            FileDialog.Filter = "Microsoft Word 2007|*.docx|All files (*.*)|*.*";
            FileDialog.FilterIndex = 1;
            FileDialog.RestoreDirectory = true;

            if (FileDialog.ShowDialog() == DialogResult.OK)
            {
                //byte[] fileHash = FileHasher.HashMD5(FileDialog.FileName);

                //if (!fileRepository.CheckFileHash(fileHash) &&
                //    fileRepository.InsertFileHashInDB(FileDialog.FileName, fileHash))
                //{
                    Cursor.Current = Cursors.WaitCursor;
                    parser = new Parser(FileDialog.FileName);
                    //parser.ParseDocument();
                    pairRepository.InsertPairs(parser.ParseDocument());
                    Cursor.Current = Cursors.Arrow;
                //}
                //else
                //{
                //    MessageBox.Show("File already exist in DB", "ScheduleApp");
                //}
            }
        }

        private void CreateSchedule_Click(object sender, EventArgs e)
        {
            var result = tutorRepository.GetPairsForTutor("Мельничин А. В.");

            TutorScheduleViewer.DataSource = result.Pairs.Select(pairMapper.Map).ToList();
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
