using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace projetSIABD.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        private MySQLEntities db = new MySQLEntities();

        public ActionResult Index()
        {
            ViewData["Message"] = "Bienvenu sur le réseau social de l'entreprise *******";
            my_aspnet_users moi = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
