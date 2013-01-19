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
        // GET: /Like/LikeANew
        [Authorize()]
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
        [Authorize()]
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

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}