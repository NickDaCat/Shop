//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Магазин
{
    using System;
    using System.Collections.Generic;
    
    public partial class Пользователь
    {
        public int Роль_сотрудника { get; set; }
        public string ФИО { get; set; }
        public string Логин { get; set; }
        public string Пароль { get; set; }

        public virtual Роль Роль { get; set; }
        //public string Роль_сотрудника_строка {  }
    }
}
