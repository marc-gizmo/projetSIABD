using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using projetSIABD;

namespace projetSIABD.Controllers
{ 
    public class MessagesController : Controller
    {
        private MySQLEntities db = new MySQLEntities();

        //
        // GET: /Messages/

        public ViewResult Index()
        {
            var messagesdbs = db.messagesdbs.Include(m => m.my_aspnet_users).Include(m => m.themesdbs);
            return View(messagesdbs.ToList());
        }

        //
        // GET: /Messages/NewsFeed

        public ViewResult NewsFeed()
        {
            var messagesdbs = db.messagesdbs.Include(m => m.my_aspnet_membership).Include(m => m.themesdbs);
            var data = new projetSIABD.Models.newsFeedModels(messagesdbs.ToList());
            return View(data);
        }

        //
        // GET: /Messages/Details/5

        public ViewResult Details(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Find(id);
            return View(messagesdbs);
        }

        //
        // GET: /Messages/Create

        public ActionResult Create()
        {
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname");
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name");
            return View();
        }

        //
        // POST: /Messages/Create

        [HttpPost]
        public ActionResult Create(messagesdbs messagesdbs)
        {
            if (ModelState.IsValid)
            {
                db.messagesdbs.Add(messagesdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", messagesdbs.author);
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // GET: /Messages/CreateANew

        public ActionResult CreateANew()
        {
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname");
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name");
            return View();
        }

        //
        // POST: /Messages/CreateANew

        [HttpPost]
        public ActionResult CreateANew(messagesdbs messagesdbs)
        {
            messagesdbs.author = 1;
            messagesdbs.censored = 0;
            messagesdbs.important = 0;
            messagesdbs.date = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.messagesdbs.Add(messagesdbs);
                db.SaveChanges();
                return RedirectToAction("NewsFeed");
            }

            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", messagesdbs.author);
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }
        
        //
        // GET: /Messages/Edit/5
 
        public ActionResult Edit(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Find(id);
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", messagesdbs.author);
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // POST: /Messages/Edit/5

        [HttpPost]
        public ActionResult Edit(messagesdbs messagesdbs)
        {
            if (ModelState.IsValid)
            {
                db.Entry(messagesdbs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", messagesdbs.author);
            ViewBag.theme = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // GET: /Messages/Delete/5
 
        public ActionResult Delete(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Find(id);
            return View(messagesdbs);
        }

        //
        // POST: /Messages/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            messagesdbs messagesdbs = db.messagesdbs.Find(id);
            db.messagesdbs.Remove(messagesdbs);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}