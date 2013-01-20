using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using projetSIABD.Models;


namespace projetSIABD.Controllers
{
    
    public class UserController : Controller
    {
        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }
        
        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }
        private MySQLEntities db = new MySQLEntities();
        //
        // GET: /User/
        [Authorize(Roles = "Administrateur")]
        public ActionResult Index()
        {
            var model = from m in db.my_aspnet_membership                      
                        join u in db.my_aspnet_users on m.userId equals u.id
                        where (m.IsLockedOut == false)
                        select new UserModel { UserName = u.name, membership = m };

            return View(model.ToList());
        }

        //
        // GET: /User/Details/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Details(int id)
        {
            var temp = from m in db.my_aspnet_membership                      
                        join u in db.my_aspnet_users on m.userId equals u.id
                        where (u.id == id)
                        select new UserModel { UserName = u.name, membership = m };

            UserModel model = new UserModel();
            model = temp.FirstOrDefault();
            return View(model);
        }

        //
        // GET: /User/Create
        [Authorize(Roles = "Administrateur")]
        public ActionResult Create()
        {
            
            return View();
        } 

        //
        // POST: /User/Create
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Create(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Tentative d'inscription de l'utilisateur
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
           
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            // Si nous sommes arrivés là, quelque chose a échoué, réafficher le formulaire
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }
        
        //
        // GET: /User/Edit/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Edit(int id)
        {
            my_aspnet_membership membership = db.my_aspnet_membership.FirstOrDefault();
            foreach (my_aspnet_membership item in db.my_aspnet_membership)
            {
                if (item.userId == id)
                {
                    membership = item;
                }
            }
            string userName = Membership.GetUserNameByEmail(membership.Email);
            UserModel model = new UserModel();
            model.UserName = userName;
            model.membership = membership;
            return View(model);
        }

        //
        // POST: /User/Edit/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Edit(UserModel model)
        {
            if (MembershipService.EditUser(model.membership))
            {
                return RedirectToAction("Index");
            }

            //Cas raté, on réaffiche le formulaire

            return View(model);
        }

        //
        // GET: /User/Delete/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Delete(int id)
        {
            var tabl = from m in db.my_aspnet_membership
                       join u in db.my_aspnet_users on m.userId equals u.id
                       where (u.id == id)
                       select new UserModel { UserName = u.name, membership = m };
            UserModel model = tabl.FirstOrDefault();

            return View(model);
        }

        //
        // POST: /User/Delete/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {      
            

            string name = db.my_aspnet_users.Where(a => a.id.Equals(id)).FirstOrDefault().name;


            if (String.IsNullOrEmpty(name))
            {
                return RedirectToAction("Delete", new { id = id });
            }
            // Peut lever une exception si l'utilisateur possède des messages ou des likes
            Membership.DeleteUser(name, true);
            
            return RedirectToAction("Index");
         
        }
    }
}
