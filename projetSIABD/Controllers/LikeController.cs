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
            var likesdbs = db.likesdbs.Include(db.messagesdbs.ToString()).Include(db.my_aspnet_users.ToString());
            return View(likesdbs.ToList());
        }

        //
        // GET: /Like/Details/5

        public ViewResult Details(int id)
        {
            likesdbs likesdbs = db.likesdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            return View(likesdbs);
        }

        //
        // GET: /Like/Create

        public ActionResult Create()
        {
            ViewData["messageApproved"] = new SelectList(db.messagesdbs, "messageID", "content");
            ViewData["liker"] = new SelectList(db.my_aspnet_users, "ID", "firstname");
            return View();
        } 

        //
        // POST: /Like/Create

        [HttpPost]
        public ActionResult Create(likesdbs likesdbs)
        {
            if (ModelState.IsValid)
            {
                db.likesdbs.AddObject(likesdbs);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewData["messageApproved"] = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewData["liker"] = new SelectList(db.my_aspnet_users, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }


        //
        // GET: /Like/LikeANew

        public ActionResult LikeANew(int id)
        {

            likesdbs likesdbs = new likesdbs();
            likesdbs.messageApproved = id;

            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            likesdbs.liker = user.id;

            // si l'utilisateur a dejà aimé la nouvelle, on ne fait rien
            //TODO

            try
            {
                db.likesdbs.AddObject(likesdbs);
                db.SaveChanges();

                return RedirectToAction("NewsFeed", "Messages");
            }
            catch
            {
                return RedirectToAction("NewsFeed", "Messages");
            }
        }

        //
        // GET: /Like/DislikeANew

        public ActionResult DislikeANew(int id)
        {
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            likesdbs likedbs = db.likesdbs.Where(l => l.messageApproved.Equals(id)).Where(l => l.liker.Equals(user.id)).FirstOrDefault();

            try
            {
                db.likesdbs.DeleteObject(likedbs);
                db.SaveChanges();
                return RedirectToAction("NewsFeed", "messages");
            }
            catch
            {
                return RedirectToAction("NewsFeed", "messages");
            }
        } 

        
        //
        // GET: /Like/Edit/5
 
        public ActionResult Edit(int id)
        {
            likesdbs likesdbs = db.likesdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            ViewData["messageApproved"] = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewData["liker"] = new SelectList(db.my_aspnet_users, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }

        //
        // POST: /Like/Edit/5

        [HttpPost]
        public ActionResult Edit(likesdbs likesdbs)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(likesdbs).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewData["messageApproved"] = new SelectList(db.messagesdbs, "messageID", "content", likesdbs.messageApproved);
            ViewData["liker"] = new SelectList(db.my_aspnet_users, "ID", "firstname", likesdbs.liker);
            return View(likesdbs);
        }

        //
        // GET: /Like/Delete/5
 
        public ActionResult Delete(int id)
        {
            likesdbs likesdbs = db.likesdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            return View(likesdbs);
        }

        //
        // POST: /Like/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            likesdbs likesdbs = db.likesdbs.Where(a => a.ID.Equals(id)).FirstOrDefault();
            db.likesdbs.DeleteObject(likesdbs);
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