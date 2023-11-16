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
    /// Логика взаимодействия для ТоварДобавитьРедатироватьWindow.xaml
    /// </summary>
    public partial class ТоварДобавитьРедатироватьWindow : Window
    {
        Товар Товар;
        public ТоварДобавитьРедатироватьWindow(Товар товар)
        {
            InitializeComponent();
            Товар = товар;
        }

        private void btСохранить_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btОтменить_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
