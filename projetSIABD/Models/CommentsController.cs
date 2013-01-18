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
            var commentsdbs = db.commentsdbs.Include(c => c.messagesdbs).Include(c => c.utilisateursdbs);
            return View(commentsdbs.ToList());
        }

        //
        // GET: /Comments/Details/5

        public ViewResult Details(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Find(id);
            return View(commentsdbs);
        }

        //
        // GET: /Comments/Create

        public ActionResult Create()
        {
            ViewBag.messageId = new SelectList(db.messagesdbs, "messageID", "content");
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname");
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
                db.commentsdbs.Add(commentsdbs);
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
                db.commentsdbs.Add(commentsdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.messageId = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", commentsdbs.author);
            return View(commentsdbs);
        }
        
        //
        // GET: /Comments/Edit/5
 
        public ActionResult Edit(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Find(id);
            ViewBag.messageId = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", commentsdbs.author);
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
            ViewBag.messageId = new SelectList(db.messagesdbs, "messageID", "content", commentsdbs.messageId);
            ViewBag.author = new SelectList(db.utilisateursdbs, "ID", "firstname", commentsdbs.author);
            return View(commentsdbs);
        }

        //
        // GET: /Comments/Delete/5
 
        public ActionResult Delete(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Find(id);
            return View(commentsdbs);
        }

        //
        // POST: /Comments/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            commentsdbs commentsdbs = db.commentsdbs.Find(id);
            db.commentsdbs.Remove(commentsdbs);
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