using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace AutoNyilvantarto
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            dataGridView1.ColumnCount = 4;
            dataGridView1.Columns[0].Name = "ID";
            dataGridView1.Columns[1].Name = "Rendszam";
            dataGridView1.Columns[2].Name = "Gyartmany";
            dataGridView1.Columns[3].Name = "Urtartalom";
            Adattabla_Frissit();
        }

        private void Adattabla_Frissit()
        {
            Program.sql.CommandText = "SELECT `id`,`Rendszam`,`Marka`,`Urtartalom` FROM `autok`";
            try
            {
                using (MySqlDataReader dr = Program.sql.ExecuteReader())
                {
                    dataGridView1.Rows.Clear();
                    while (dr.Read())
                    {
                        int sor_index = dataGridView1.Rows.Add();
                        dataGridView1.Rows[sor_index].Cells["ID"].Value = dr.GetInt32("id");
                        dataGridView1.Rows[sor_index].Cells["Rendszam"].Value = dr.GetString("Rendszam");
                        dataGridView1.Rows[sor_index].Cells["Gyartmany"].Value = dr.GetString("Marka");
                        dataGridView1.Rows[sor_index].Cells["Urtartalom"].Value = dr.GetInt32("Urtartalom");
                    }
                }
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void button_Insert_Click(object sender, EventArgs e)
        {
            Program.sql.CommandText = "INSERT INTO `autok` (`id`, `Rendszam`, `Marka`, `Urtartalom`) VALUES (NULL, @Rendszam, @Gyartmany, @cm3);";
            Program.sql.Parameters.Clear();
            Program.sql.Parameters.AddWithValue("@Rendszam", textBox_Rendszam.Text.Trim());
            Program.sql.Parameters.AddWithValue("@Gyartmany", textBox_Gyartmany.Text.Trim());
            Program.sql.Parameters.AddWithValue("@cm3", (int)numericUpDown_Urtartalom.Value);
            try
            {
                Program.sql.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            Adattabla_Frissit();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int sor_index = dataGridView1.SelectedCells[0].RowIndex;
            textBox_Rendszam.Text = dataGridView1.Rows[sor_index].Cells["Rendszam"].Value.ToString();
            textBox_Gyartmany.Text = dataGridView1.Rows[sor_index].Cells["Gyartmany"].Value.ToString();
            numericUpDown_Urtartalom.Value = (int)dataGridView1.Rows[sor_index].Cells["Urtartalom"].Value;
        }

        private void button_Delete_Click(object sender, EventArgs e)
        {
            Program.sql.CommandText = "DELETE FROM `autok` WHERE `id`=@id;";
            Program.sql.Parameters.Clear();
            Program.sql.Parameters.AddWithValue("@id", dataGridView1.Rows[dataGridView1.SelectedCells[0].RowIndex].Cells["ID"].Value);
            try
            {
                Program.sql.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            Adattabla_Frissit();
        }

        private void button_Update_Click(object sender, EventArgs e)
        {
            Program.sql.CommandText = "UPDATE `autok` SET `Rendszam`=@Rendszam,`Marka`=@Gyartmany,`Urtartalom`=@cm3 WHERE `id`=@id;";
            Program.sql.Parameters.Clear();
            int sor_index = dataGridView1.SelectedCells[0].RowIndex;

            Program.sql.Parameters.AddWithValue("@id", dataGridView1.Rows[sor_index].Cells["ID"].Value);
            Program.sql.Parameters.AddWithValue("@Redszam", textBox_Rendszam.Text);
            Program.sql.Parameters.AddWithValue("@Gyartmany", textBox_Gyartmany.Text);
            Program.sql.Parameters.AddWithValue("@cm3", (int)numericUpDown_Urtartalom.Value);
            try
            {
                Program.sql.ExecuteNonQuery();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }

            Adattabla_Frissit();
        }
    }
}
