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
        // GET: /Messages/NewsFeed
        [Authorize()]
        public ViewResult NewsFeed()
        {
            //var messagesdbs = db.messagesdbs.Include("my_aspnet_users").Include("themesdbs");
            var messagesdbstest = from m in db.messagesdbs
                              //join u in db.my_aspnet_users on m.author equals u.id
                              //join t in db.themesdbs on m.theme equals t.themeId
                              select m;
            List<messagesdbs> tmp = messagesdbstest.ToList();
            var data = new projetSIABD.Models.newsFeedModels(tmp, User.Identity.Name, User.IsInRole("administrateur"));
            return View(data);
        }

        //
        // GET: /Messages/CreateANew
        [Authorize()]
        public ActionResult CreateANew()
        {
            return View();
        }

        //
        // POST: /Messages/CreateANew
        [Authorize()]
        [HttpPost]
        public ActionResult CreateANew(messagesdbs messagesdbs)
        {
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            messagesdbs.author = user.id;
            messagesdbs.censored = 0;
            messagesdbs.important = 0;
            messagesdbs.date = DateTime.Now;

            try
            {
                db.messagesdbs.AddObject(messagesdbs);
                db.SaveChanges();

                return RedirectToAction("NewsFeed");
            }
            catch
            {
                return View(messagesdbs);
            }
        }

        //
        // POST: /Messages/DeleteMyMessage
        [Authorize()]
        public ActionResult DeleteMyMessage(int id)
        {
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            messagesdbs messagesdbs = db.messagesdbs.Where(m => m.messageID.Equals(id)).FirstOrDefault();
            if (messagesdbs.author == user.id) // on a le droit de supprimer que ses messages
            {
                try
                {
                    db.messagesdbs.DeleteObject(messagesdbs);
                    db.SaveChanges();

                    return RedirectToAction("NewsFeed");
                }
                catch
                {
                    return RedirectToAction("NewsFeed");
                }
            }
            else
            {
                //il faut afficher un message d'erreur
                return RedirectToAction("NewsFeed");
            }
        }

        //
        // POST: /Messages/ModerateMessage
        [Authorize(Roles = "Administrateur")]
        public ActionResult ModerateMessage(int id)
        {
            messagesdbs messagesdbs = db.messagesdbs.Where(m => m.messageID.Equals(id)).FirstOrDefault();
            try
            {
                db.messagesdbs.DeleteObject(messagesdbs);
                db.SaveChanges();

                return RedirectToAction("NewsFeed");
            }
            catch
            {
                return RedirectToAction("NewsFeed");
            }
        }
        
        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}