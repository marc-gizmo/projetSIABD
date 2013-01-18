using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace projetSIABD.Models
{
    #region Modèles
    public class ThemeIndexModels
    {
        public themesdbs theme;
        public int nbUser;
        public int isInTheme;
    }
    public class ThemeAbonnementModels
    {
        public abonnesdbs abonnement;
        public my_aspnet_users user;
    }
    public class ThemeEditModels
    {
        public themesdbs theme;
        public List<ThemeAbonnementModels> abonnements;
    }
    public class ThemeDelUserModels
    {
        public int abonneId;
        public string UserName;
        public string ThemeName;
    }
    #endregion
}