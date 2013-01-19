using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using projetSIABD.Models;
using System.Data.Entity;

namespace projetSIABD.Controllers
{
    public class ThemesController : Controller
    {
        private MySQLEntities db = new MySQLEntities();
        //
        // GET: /Themes/
        [Authorize()]
        public ActionResult Index()
        {
            var tabl = from t in db.themesdbs
                       where t.themeId > 1
                       join a in db.abonnesdbs on t.themeId equals a.theme into themeGroup                       
                       select new ThemeIndexModels { theme = t, nbUser =  themeGroup.Count(), isInTheme = 0};
            IEnumerable<ThemeIndexModels> model = tabl.ToList();
            my_aspnet_users moi = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();


            foreach (var item in model)
            {
                
                abonnesdbs abonne = db.abonnesdbs.Where(a => a.theme.Equals(item.theme.themeId)).Where(a => a.user.Equals(moi.id)).FirstOrDefault();

                if (abonne != null)
                {
                    item.isInTheme = abonne.ID;
                }


            }

            
            
            return View(model);
        }

     

        //
        // GET: /Themes/Create
        [Authorize()]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Themes/Create
        [Authorize()]
        [HttpPost]
        public ActionResult Create(themesdbs model)
        {
            try
            {
                db.themesdbs.AddObject(model);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }
        
        //
        // GET: /Themes/Edit/5
        [Authorize(Roles="Administrateur")]
        public ActionResult Edit(int id)
        {
            var tabl = from t in db.themesdbs
                       join a in db.abonnesdbs on t.themeId equals a.theme
                       join u in db.my_aspnet_users on a.user equals u.id
                       where (t.themeId == id)
                       select new ThemeAbonnementModels { abonnement = a, user = u };

            ThemeEditModels model = new ThemeEditModels();
            model.theme = db.themesdbs.Where(a => a.themeId.Equals(id)).FirstOrDefault();
            model.abonnements = tabl.ToList();

            return View(model);
        }

        //
        // POST: /Themes/Edit/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            themesdbs theme = db.themesdbs.Where(a => a.themeId.Equals(id)).FirstOrDefault();
            
            try
            {

                theme.name = collection["theme.name"];

                db.SaveChanges();
 
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Edit",id);
            }
        }

        //
        // GET: /Themes/Delete/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Delete(int id)
        {
            themesdbs model = db.themesdbs.Where(a => a.themeId.Equals(id)).FirstOrDefault();
            return View(model);
        }

        //
        // POST: /Themes/Delete/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection Collection)
        {
            themesdbs model = db.themesdbs.Where(a => a.themeId.Equals(id)).FirstOrDefault();
            try
            {
               
                db.themesdbs.DeleteObject(model);
                db.SaveChanges();
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View(model.themeId);
            }
        }

        //
        // GET : /Themes/DelUser/5
        [Authorize()]
        public ActionResult DelUser(int id)
        {
            var tabl = from t in db.themesdbs
                       join a in db.abonnesdbs on t.themeId equals a.theme
                       join u in db.my_aspnet_users on a.user equals u.id
                       where (a.ID == id)
                       select new ThemeDelUserModels{ abonneId = a.ID, ThemeName = t.name, UserName = u.name };

            ThemeDelUserModels model = tabl.FirstOrDefault();

            return View(model);
        }

        //
        // POST : /Themes/DelUser/5
        [Authorize()]
        [HttpPost]
        public ActionResult DelUser(int id, FormCollection collection)
        {
            try
            {
                abonnesdbs abonne = db.abonnesdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
                db.abonnesdbs.DeleteObject(abonne);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch 
            {
                return RedirectToAction("DelUser", id);
            }
        }


        //
        // GET : /Themes/AddUser/5
        [Authorize()]
        public ActionResult AddUser(int id)
        {
            themesdbs theme = db.themesdbs.Where(a => a.themeId.Equals(id)).FirstOrDefault();
            return View(theme);
        }

        //
        // POST : /Themes/AddUser/5
        [Authorize()]
        [HttpPost]
        public ActionResult AddUser(int id, FormCollection collection)
        {
            try
            {
                my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();

                abonnesdbs abonne = new abonnesdbs();
                abonne.user = user.id;
                abonne.theme = id;

                db.abonnesdbs.AddObject(abonne);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("AddUser", id);
            }

            
        }
    }
}
