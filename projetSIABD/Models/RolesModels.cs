using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace projetSIABD.Models
{
#region Modèles
    public class RolesWithUserModels
    {
        [Required]
        [DisplayName("Identifiant de l'utilisateur")]
        public int UserId { get; set; }

        [Required]
        [DisplayName("Nom de l'utilisateur")]
        public string UserName { get; set; }

        [Required]
        [DisplayName("Identifiant du rôle")]
        public int RoleId { get; set; }

        [Required]
        [DisplayName("Nom du rôle")]
        public string RoleName { get; set; }


    }

    public class RolesIndexModels
    {
        public IEnumerable<RolesWithUserModels> UserWithRoles { get; set; }

        public IEnumerable<my_aspnet_roles> Roles { get; set; }
    }

    public class RoleAddModels
    {
        [Required]
        public List<SelectListItem> RolesName { get; set; }

        [Required]
        public List<SelectListItem> UsersName { get; set; }
    }
#endregion
}