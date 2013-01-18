using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using projetSIABD.Models;
using System.Data.Entity;

namespace projetSIABD.Controllers
{
    public class ThemeController2 : Controller
    {
        private MySQLEntities db = new MySQLEntities();
        //
        // GET: /Theme/
        
        public ActionResult Index()
        {
            /*var tabl = from t in db.themesdbs
                       join a in db.abonnesdbs on t.themeId equals a.theme into themeGroup                       
                       select new ThemeIndexModels { theme = t, nbUser = themeGroup.Count()};
            
            
            /*foreach (var item in tabl)
            {
                item.nbUser = (from t in db.themesdbs
                         join a in db.abonnesdbs on t.themeId equals a.theme
                         where (t.themeId == item.theme.themeId)
                         select a ).Count();
            }
            ViewData[""] = 3;*/

            //IEnumerable<ThemeIndexModels> model = tabl.ToList();


            return View();
        }


        //
        // GET: /Theme/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Theme/Create
        
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
        // GET: /Theme/Edit/5
        [Authorize(Roles="Administrateur")]
        public ActionResult Edit(int id)
        {
            var table = from t in db.themesdbs
                        join a in db.abonnesdbs on t.themeId equals a.theme
                        join u in db.my_aspnet_users on a.user equals u.id
                        where (t.themeId == id)
                        select new { UserId = u.id, UserName = u.name };
            return View();
        }

        //
        // POST: /Theme/Edit/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Theme/Delete/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Delete(int id)
        {
			
            return View();
        }

        //
        // POST: /Theme/Delete/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
