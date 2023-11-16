using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Магазин
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void btВыйти_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btВойти_Click(object sender, RoutedEventArgs e)
        {
            var Проверка = (from item in App.DB.Пользователь.ToList() where item.Логин == tbЛогин.Text && item.Пароль == pbПароль.Password select item).ToList();
            if (Проверка.Any())
            {
                App.ТекущийПользователь = Проверка[0];
                this.Close();
            }
            else MessageBox.Show("Неверный логин или пароль!");
        }
    }
}
