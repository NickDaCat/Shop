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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Магазин
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.ShowDialog();
            if (App.ТекущийПользователь == null)
                this.Close();
            label.Content = App.DB.Роль.Where(i => i.id.Equals(App.ТекущийПользователь.Роль_сотрудника)).First().Наименование;
            Обновить();
        }
        public void Обновить()
        {
            Товары.ItemsSource = null;
            Товары.ItemsSource = App.DB.Товар.ToList();
            foreach (var item in App.DB.Товар.ToList())
            {
                if (item.Изображение == null)
                    item.Изображение = "picture.png";
                App.DB.SaveChanges();
            }
            Пользователи.ItemsSource = null;
            Пользователи.ItemsSource = App.DB.Пользователь.ToList();
            Роли.ItemsSource = null;
            Роли.ItemsSource = App.DB.Роль.ToList();
            Заказы.ItemsSource = null;
            Заказы.ItemsSource = App.DB.Заказ.ToList();
            ПунктыВыдачи.ItemsSource = null;
            ПунктыВыдачи.ItemsSource = App.DB.Пункт_выдачи.ToList();
        }

        private void btДоавитьТовар_Click(object sender, RoutedEventArgs e)
        {
            Товар товар = null;
            ТоварДобавитьРедатироватьWindow товарДобавитьРедатироватьWindow = new ТоварДобавитьРедатироватьWindow(товар);
            товарДобавитьРедатироватьWindow.ShowDialog();
            Обновить();
            App.DB.SaveChanges();
        }

        private void btРедавтироватьТовар_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btУдалитьТовар_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
