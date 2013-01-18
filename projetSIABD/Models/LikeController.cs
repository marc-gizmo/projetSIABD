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
    public class LikeController : Controller
    {
        private MySQLEntities db = new MySQLEntities();

        //
        // GET: /Like/

        public ViewResult Index()
        {
            var likesdbs = db.likesdbs.Include(l => l.messagesdbs).Include(l => l.utilisateursdbs);
            return View(likesdbs.ToList());
        }

        //
        // GET: /Like/Details/5

        public ViewResult Details(int id)
        {
            likesdbs likesdbs = db.likesdbs.Find(id);
            return View(likesdbs);
        }

        //
        // GET: /Like/Create

        public ActionResult Create()
        {
            ViewBag.messageApproved = new SelectList(db.messagesdbs, "messageID", "content");
            ViewBag.liker = new SelectList(db.utilisateursdbs, "ID", "firstname");
            return View();
        } 

        //
        // POST: /Like/Create

        [HttpPost]
        public ActionResult Create(likesdbs likesdbs)
        {
            if (ModelState.IsValid)
            {
                db.likesdbs.Add(likesdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.messageApproved = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewBag.liker = new SelectList(db.utilisateursdbs, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }


        //
        // GET: /Like/LikeANew

        public ActionResult LikeANew(int id)
        {
            likesdbs likesdbs = new likesdbs();
            likesdbs.messageApproved = id;
            //likesdbs.liker = User.Identity.Name;
            //db.my_aspnet_user
            if (ModelState.IsValid) // must be useless since no input error can occur
            {
                db.likesdbs.Add(likesdbs);
                db.SaveChanges();
                return RedirectToAction("../Messages/NewsFeed");
            }
            return RedirectToAction("../Messages/NewsFeed");
        }

        //
        // GET: /Like/DislikeANew

        public ActionResult DislikeANew(int id)
        {
            if (ModelState.IsValid) // must be useless since no input error can occur
            {
                likesdbs likesdbs = db.likesdbs.Where(a => a.liker.Equals(1) && a.messageApproved.Equals(id)).Last();
                db.likesdbs.Remove(likesdbs);
                db.SaveChanges();
                return RedirectToAction("../Messages/NewsFeed");
            }
            return RedirectToAction("../Messages/NewsFeed");
        } 

        
        //
        // GET: /Like/Edit/5
 
        public ActionResult Edit(int id)
        {
            likesdbs likesdbs = db.likesdbs.Find(id);
            ViewBag.messageApproved = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewBag.liker = new SelectList(db.utilisateursdbs, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }

        //
        // POST: /Like/Edit/5

        [HttpPost]
        public ActionResult Edit(likesdbs likesdbs)
        {
            if (ModelState.IsValid)
            {
                db.Entry(likesdbs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.messageApproved = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewBag.liker = new SelectList(db.utilisateursdbs, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }

        //
        // GET: /Like/Delete/5
 
        public ActionResult Delete(int id)
        {
            likesdbs likesdbs = db.likesdbs.Find(id);
            return View(likesdbs);
        }

        //
        // POST: /Like/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            likesdbs likesdbs = db.likesdbs.Find(id);
            db.likesdbs.Remove(likesdbs);
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