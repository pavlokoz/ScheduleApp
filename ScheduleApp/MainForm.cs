using DAL;
using DocumentParser;
using System;
using System.Windows.Forms;

namespace ScheduleApp
{
    public partial class MainForm : Form
    {
        private Parser parser;
        private FileRepository fileRepository;
        private PairRepository pairRepository;

        public MainForm()
        {
            InitializeComponent();
            fileRepository = new FileRepository();
            pairRepository = new PairRepository();
        }

        private void LoadButton_Click(object sender, EventArgs e)

        {
            FileDialog.Filter = "Microsoft Word 2007|*.docx|All files (*.*)|*.*";
            FileDialog.FilterIndex = 1;
            FileDialog.RestoreDirectory = true;

            if (FileDialog.ShowDialog() == DialogResult.OK)
            {
                byte[] fileHash = FileHasher.HashMD5(FileDialog.FileName);

                if (!fileRepository.CheckFileHash(fileHash) &&
                    fileRepository.InsertFileHashInDB(FileDialog.FileName, fileHash))
                {
                    Cursor.Current = Cursors.WaitCursor;
                    parser = new Parser(FileDialog.FileName);
                    pairRepository.InsertPairs(parser.ParseDocument());
                    Cursor.Current = Cursors.Arrow;
                }
                else
                {
                    MessageBox.Show("File already exist in DB", "ScheduleApp");
                }
            }
        }
    }
}
