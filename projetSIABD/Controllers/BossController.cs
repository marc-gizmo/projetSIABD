using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using projetSIABD.Models;
using System.Data.Entity;

namespace projetSIABD.Controllers
{
    public class BossController : Controller
    {
        private MySQLEntities db = new MySQLEntities();
        //
        // GET: /Boss/
        [Authorize(Roles = "Boss")]
        public ActionResult Index()
        {
            var model = from m in db.my_aspnet_membership
                        join u in db.my_aspnet_users on m.userId equals u.id
                        where(u.id >=1 )
                        select new BossModels { UserName = u.name, membership = m };


            return View(model.ToList());
        }

    }
}
