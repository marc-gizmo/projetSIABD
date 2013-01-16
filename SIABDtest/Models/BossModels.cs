using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace projetSIABD.Models
{
    #region modèles
    public class BossModels
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        public my_aspnet_membership membership { get; set; }
    }
    #endregion
}