namespace ScheduleApp
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.OpenFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.LoadButton = new System.Windows.Forms.Button();
            this.TutorScheduleViewer = new System.Windows.Forms.DataGridView();
            this.ClearDB = new System.Windows.Forms.Button();
            this.CreateButton = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.TutorScheduleViewer)).BeginInit();
            this.SuspendLayout();
            // 
            // OpenFileDialog
            // 
            this.OpenFileDialog.FileName = "Schedule";
            // 
            // LoadButton
            // 
            this.LoadButton.Location = new System.Drawing.Point(836, 415);
            this.LoadButton.Name = "LoadButton";
            this.LoadButton.Size = new System.Drawing.Size(145, 23);
            this.LoadButton.TabIndex = 0;
            this.LoadButton.Text = "Load Document";
            this.LoadButton.UseVisualStyleBackColor = true;
            this.LoadButton.Click += new System.EventHandler(this.LoadButton_Click);
            // 
            // TutorScheduleViewer
            // 
            this.TutorScheduleViewer.AllowUserToAddRows = false;
            this.TutorScheduleViewer.AllowUserToDeleteRows = false;
            this.TutorScheduleViewer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.TutorScheduleViewer.Location = new System.Drawing.Point(12, 13);
            this.TutorScheduleViewer.Name = "TutorScheduleViewer";
            this.TutorScheduleViewer.ReadOnly = true;
            this.TutorScheduleViewer.Size = new System.Drawing.Size(969, 396);
            this.TutorScheduleViewer.TabIndex = 1;
            this.TutorScheduleViewer.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.TutorScheduleViewer_CellFormatting);
            this.TutorScheduleViewer.CellPainting += new System.Windows.Forms.DataGridViewCellPaintingEventHandler(this.TutorScheduleViewer_CellPainting);
            // 
            // ClearDB
            // 
            this.ClearDB.Location = new System.Drawing.Point(674, 415);
            this.ClearDB.Name = "ClearDB";
            this.ClearDB.Size = new System.Drawing.Size(75, 23);
            this.ClearDB.TabIndex = 3;
            this.ClearDB.Text = "ClearDB";
            this.ClearDB.UseVisualStyleBackColor = true;
            this.ClearDB.Click += new System.EventHandler(this.ClearDB_Click);
            // 
            // CreateButton
            // 
            this.CreateButton.Location = new System.Drawing.Point(755, 415);
            this.CreateButton.Name = "CreateButton";
            this.CreateButton.Size = new System.Drawing.Size(75, 23);
            this.CreateButton.TabIndex = 4;
            this.CreateButton.Text = "Create Document";
            this.CreateButton.UseVisualStyleBackColor = true;
            this.CreateButton.Click += new System.EventHandler(this.CreateButton_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(993, 450);
            this.Controls.Add(this.CreateButton);
            this.Controls.Add(this.ClearDB);
            this.Controls.Add(this.TutorScheduleViewer);
            this.Controls.Add(this.LoadButton);
            this.Name = "MainForm";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.TutorScheduleViewer)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.OpenFileDialog OpenFileDialog;
        private System.Windows.Forms.Button LoadButton;
        private System.Windows.Forms.DataGridView TutorScheduleViewer;
        private System.Windows.Forms.Button ClearDB;
        private System.Windows.Forms.Button CreateButton;
    }
}

