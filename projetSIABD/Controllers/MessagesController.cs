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
                                  join u in db.my_aspnet_users on m.author equals u.id
                                  join t in db.themesdbs on m.theme equals t.themeId
                                  select new projetSIABD.Models.messageWithJoin { nouvelle = m, author = u.name, theme = t.name };

            //on selectionne les messages sans theme
            List<projetSIABD.Models.messageWithJoin> aux2 = messagesdbstest.ToList();
            List<projetSIABD.Models.messageWithJoin> tmp = aux2.Where(t => t.theme.Equals("defaut")).ToList();

            // on recupère la liste des themes où l'utilisateur est abonné
            my_aspnet_users moi = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            var list = from a in db.abonnesdbs
                       select a;
            list = list.Where(l => l.user.Equals(moi.id));
            foreach (var i in list)
            {
                var aux = aux2.Where(a => a.nouvelle.theme.Equals(i.theme)).ToList();
                foreach (var j in aux)
                {
                    tmp.Add(j);
                }
            }

            tmp = tmp.OrderByDescending(t => t.nouvelle.date).ToList();
            var data = new projetSIABD.Models.newsFeedModels(tmp, User.Identity.Name, User.IsInRole("administrateur"));
            return View(data);
        }

        //
        // GET: /Messages/MessagesInTheme
        [Authorize()]
        public ViewResult MessagesInTheme(int themeId)
        {
            var messagesdbstest = from m in db.messagesdbs
                                  join u in db.my_aspnet_users on m.author equals u.id
                                  join t in db.themesdbs on m.theme equals t.themeId
                                  select new projetSIABD.Models.messageWithJoin { nouvelle = m, author = u.name, theme = t.name };
            List<projetSIABD.Models.messageWithJoin> aux = messagesdbstest.ToList();

            var tmp = aux.Where(m => m.nouvelle.theme.Equals(themeId)).OrderByDescending(t => t.nouvelle.date).ToList();
            var data = new projetSIABD.Models.newsFeedModels(tmp, User.Identity.Name, User.IsInRole("administrateur"));
            return View(data);
        }


        //
        // GET: /Messages/MyMessages

        [Authorize()]
        public ViewResult MyMessages()
        {
            my_aspnet_users moi = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();

            var messagesdbstest = from m in db.messagesdbs
                                  join u in db.my_aspnet_users on m.author equals u.id
                                  join t in db.themesdbs on m.theme equals t.themeId
                                  select new projetSIABD.Models.messageWithJoin { nouvelle = m, author = u.name, theme = t.name };

            //on prend les nouvelles de l'utilisateur
            List<projetSIABD.Models.messageWithJoin> tmp = messagesdbstest.Where(m => m.nouvelle.author.Equals(moi.id)).ToList();
            //List<projetSIABD.Models.messageWithJoin> tmp = messagesdbstest.ToList();
            //tmp = tmp.Where(t => t.author.Equals(moi.id)).ToList();

            
            //on prend aussi les commentaires de l'utilisateur (on les ajoute à la liste tmp)
            var commentsdbs = from m in db.commentsdbs
                              select m;
            List<commentsdbs> tmp2 = commentsdbs.Where(c => c.author.Equals(moi.id)).ToList();
            foreach (var i in tmp2)
            {
                var aux = messagesdbstest.Where(m => m.nouvelle.messageID.Equals(i.messageId)).ToList().LastOrDefault();
                if (tmp.Exists(t => t.nouvelle.messageID.Equals(aux.nouvelle.messageID))) { }//si on a deja cette nouvelle, on ne l'ajoute pas 
                else { tmp.Add(aux); }
            }

            tmp = tmp.Distinct().OrderByDescending(t => t.nouvelle.date).ToList();
            

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
            messagesdbs.theme = 1; //le theme d'ID 1 est le theme par defaut.
            messagesdbs.important = 0;
            messagesdbs.date = DateTime.UtcNow;

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
        // GET: /Messages/CreateThemedNew
        [Authorize()]
        public ActionResult CreateThemedNew(int themeId)
        {
            messagesdbs messagesdbs = new messagesdbs();
            messagesdbs.theme = themeId;
            return View(messagesdbs);
        }

        //
        // POST: /Messages/CreateThemedNew
        [Authorize()]
        [HttpPost]
        public ActionResult CreateThemedNew(messagesdbs messagesdbs)
        {
            my_aspnet_users user = db.my_aspnet_users.Where(a => a.name.Equals(User.Identity.Name)).FirstOrDefault();
            messagesdbs.author = user.id;
            messagesdbs.censored = 0;
            messagesdbs.important = 0;
            messagesdbs.date = DateTime.UtcNow;

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