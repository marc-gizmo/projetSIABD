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
    public class CommentsController : Controller
    {
        private MySQLEntities db = new MySQLEntities();

        //
        // GET: /Comments/

        public ViewResult Index()
        {
            var commentsdbs = db.commentsdbs.Include(db.messagesdbs.ToString()).Include(db.my_aspnet_users.ToString());
            return View(commentsdbs.ToList());
        }

        //
        // GET: /Comments/Details/5

        public ViewResult Details(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            return View(commentsdbs);
        }

        //
        // GET: /Comments/Create

        public ActionResult Create()
        {
            ViewData["messageId"] = new SelectList(db.messagesdbs, "messageID", "content");
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname");
            return View();
        }

        //
        // GET: /Comments/CreateAComment

        public ActionResult CreateAComment(int id)
        {
            commentsdbs commentsdbs = new commentsdbs();
            commentsdbs.messageId = id;
            return View(commentsdbs);
        }

        //
        // POST: /Comments/CreateAComment

        [HttpPost]
        public ActionResult CreateAComment(commentsdbs commentsdbs)
        {
            commentsdbs.author = 1;
            commentsdbs.date = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.commentsdbs.AddObject(commentsdbs);
                db.SaveChanges();
                return RedirectToAction("../Messages/NewsFeed");
            }
            return View(commentsdbs);
        }


        //
        // POST: /Comments/Create

        [HttpPost]
        public ActionResult Create(commentsdbs commentsdbs)
        {
            if (ModelState.IsValid)
            {
                db.commentsdbs.AddObject(commentsdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewData["messageId"] = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", commentsdbs.author);
            return View(commentsdbs);
        }
        
        //
        // GET: /Comments/Edit/5
 
        public ActionResult Edit(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            ViewData["messageId"] = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", commentsdbs.author);
            return View(commentsdbs);
        }

        //
        // POST: /Comments/Edit/5

        [HttpPost]
        public ActionResult Edit(commentsdbs commentsdbs)
        {
            if (ModelState.IsValid)
            {
                db.Entry(commentsdbs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["messageId"] = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewData["author"] = new SelectList(db.my_aspnet_users, "ID", "firstname", commentsdbs.author);
            return View(commentsdbs);
        }

        //
        // GET: /Comments/Delete/5
 
        public ActionResult Delete(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            return View(commentsdbs);
        }

        //
        // POST: /Comments/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            db.commentsdbs.DeleteObject(commentsdbs);
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