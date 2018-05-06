using DAL;
using DocumentParser;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                //byte[] fileHash = FileHasher.HashMD5(FileDialog.FileName);
                //if (!fileRepository.CheckFileHash(fileHash) &&
                //    fileRepository.InsertFileHashInDB(FileDialog.FileName, fileHash))
                //{
                    parser = new Parser(FileDialog.FileName);
                    this.pairRepository.InsertPairs(parser.ParseDocument());
                //}
                //else
                //{
                //    MessageBox.Show("File already exist in DB", "ScheduleApp");
                //}
            }
        }
    }
}
