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
        // GET: /Comments/CreateAComment
        [Authorize()]
        public ActionResult CreateAComment(int id)
        {
            commentsdbs commentsdbs = new commentsdbs();
            commentsdbs.messageId = id;
            return View(commentsdbs);
        }

        //
        // POST: /Comments/CreateAComment
        [Authorize()]
        [HttpPost]
        public ActionResult CreateAComment(commentsdbs commentsdbs)
        {
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            commentsdbs.author = user.id;
            commentsdbs.date = DateTime.Now;

            try
            {
                db.commentsdbs.AddObject(commentsdbs);
                db.SaveChanges();

                return RedirectToAction("NewsFeed", "Messages");
            }
            catch
            {
                return View(commentsdbs);
            }
        }

        //
        // POST: /Messages/DeleteMyComment
        [Authorize()]
        public ActionResult DeleteMyComment(int id)
        {
            my_aspnet_users moi = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            commentsdbs commentsdbs = db.commentsdbs.Where(m => m.ID.Equals(id)).FirstOrDefault();
            if (commentsdbs.author == moi.id) // on a le droit de supprimer que ses messages
            {
                try
                {
                    db.commentsdbs.DeleteObject(commentsdbs);
                    db.SaveChanges();

                    return RedirectToAction("NewsFeed", "Messages");
                }
                catch
                {
                    return RedirectToAction("NewsFeed", "Messages");
                }
            }
            else
            {
                //il faut afficher un message d'erreur
                return RedirectToAction("NewsFeed", "Messages");
            }
        }

        //
        // POST: /Messages/ModerateComment
        [Authorize(Roles = "Administrateur")]
        public ActionResult ModerateComment(int id)
        {
            commentsdbs commentsdbs = db.commentsdbs.Where(m => m.ID.Equals(id)).FirstOrDefault();
            try
            {
                db.commentsdbs.DeleteObject(commentsdbs);
                db.SaveChanges();


                return RedirectToAction("NewsFeed", "Messages");
            }
            catch
            {
                return RedirectToAction("NewsFeed", "Messages");

            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}