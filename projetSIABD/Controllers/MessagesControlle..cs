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
            var messagesdbs = from m in db.messagesdbs
                                  join u in db.my_aspnet_users on m.author equals u.id
                                  join t in db.themesdbs on m.theme equals t.themeId
                                  select new messagesdbs { content = m.content, author = m.author, messageID = m.messageID};
            IEnumerable<messagesdbs> data = messagesdbs.ToList();

            return View(messagesdbs.ToList());
        }

        //
        // GET: /Messages/NewsFeed

        public ViewResult NewsFeed()
        {
            //var messagesdbs = db.messagesdbs.Include("my_aspnet_users").Include("themesdbs");
            var messagesdbstest = from m in db.messagesdbs
                              join u in db.my_aspnet_users on m.author equals u.id
                              join t in db.themesdbs on m.theme equals t.themeId
                              select new messagesdbs { content = m.content, author = m.author, messageID = m.messageID, censored = m.censored, date = m.date, important = m.important};
            IEnumerable<messagesdbs> data = messagesdbstest.ToList();
            return View(data);
        }

        //
        // GET: /Messages/Details/5

        public ViewResult Details(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Where(a => a.messageID.Equals(id)).FirstOrDefault();
            return View(messagesdbs);
        }

        //
        // GET: /Messages/Create

        public ActionResult Create()
        {
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname");
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name");
            return View();
        }

        //
        // POST: /Messages/Create

        [HttpPost]
        public ActionResult Create(messagesdbs messagesdbs)
        {
            if (ModelState.IsValid)
            {
                db.messagesdbs.AddObject(messagesdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", messagesdbs.author);
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // GET: /Messages/CreateANew

        public ActionResult CreateANew()
        {
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname");
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name");
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
                db.messagesdbs.AddObject(messagesdbs);
                db.SaveChanges();
                return RedirectToAction("NewsFeed");
            }

            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", messagesdbs.author);
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }
        
        //
        // GET: /Messages/Edit/5
 
        public ActionResult Edit(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Where(a => a.messageID.Equals(id)).FirstOrDefault();
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", messagesdbs.author);
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // POST: /Messages/Edit/5

        [HttpPost]
        public ActionResult Edit(messagesdbs messagesdbs)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(messagesdbs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", messagesdbs.author);
            ViewData["theme"] = new SelectList(db.themesdbs, "themeId", "name", messagesdbs.theme);
            return View(messagesdbs);
        }

        //
        // GET: /Messages/Delete/5
 
        public ActionResult Delete(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Where(a => a.messageID.Equals(id)).FirstOrDefault();
            return View(messagesdbs);
        }

        //
        // POST: /Messages/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Where(a => a.messageID.Equals(id)).FirstOrDefault();

            db.messagesdbs.DeleteObject(messagesdbs);
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