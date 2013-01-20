using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using projetSIABD.Models;
using System.Data.Entity;

namespace projetSIABD.Controllers
{
    public class RolesController : Controller
    {
        private MySQLEntities db = new MySQLEntities();
        //
        // GET: /Roles/
        [Authorize(Roles = "Administrateur")]
        public ActionResult Index()
        {
            var roles = from r in db.my_aspnet_roles
                        join ur in db.my_aspnet_usersinroles on r.id equals ur.roleId
                        join u in db.my_aspnet_users on ur.userId equals u.id
                        select new RolesWithUserModels{ UserId = u.id, UserName = u.name, RoleId = r.id, RoleName = r.name };

            RolesIndexModels index = new RolesIndexModels();

            index.Roles = db.my_aspnet_roles.ToList();
            index.UserWithRoles = roles.ToList();

            return View(index);
        }

        //
        // GET: /Roles/Details/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Roles/Create
        [Authorize(Roles = "Administrateur")]
        public ActionResult Create()
        {

            return View();
        } 

        //
        // POST: /Roles/Create
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Create(string RoleName)
        {
            if (ModelState.IsValid)
            {
                // Tentative de création du role

                Roles.CreateRole(RoleName);
                return RedirectToAction("Index");

            }

            // Si nous sommes arrivés là, quelque chose a échoué, réafficher le formulaire
     
            return View(RoleName);
        }

        //
        // GET: /Roles/Delete/5
        [Authorize(Roles = "Administrateur")]
        public ActionResult Delete(int id)
        {
            my_aspnet_roles model = db.my_aspnet_roles.Where(a => a.id.Equals(id)).FirstOrDefault();
            
            return View(model);
        }

        //
        // POST: /Roles/Delete/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult Delete(my_aspnet_roles Model)
        {
            try
            {
                // On regarde s'il reste des users qui ont le rôle

                var tabl = from r in db.my_aspnet_roles
                            join ur in db.my_aspnet_usersinroles on r.id equals ur.userId
                            where (r.id.Equals(Model.id))
                            select ur;
                var users = tabl.ToList();

                if (users != null)
                {
                    foreach (var item in users)
                    {
                        db.my_aspnet_usersinroles.DeleteObject(item);
                    }
                    db.SaveChanges();
                }
                // On supprime le rôle
                Roles.DeleteRole(Model.name);

                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("Delete",Model.id);
            }
        }

        //
        // GET : /Roles/AddUser
        [Authorize(Roles = "Administrateur")]
        public ActionResult AddUser()
        {
            var roles = from p in db.my_aspnet_roles
                        select p.name ;
            
            var user = from u in db.my_aspnet_users
                       join m in db.my_aspnet_membership on u.id equals m.userId
                       where (m.IsLockedOut == false)
                       select u.name ;

            List<SelectListItem> tablRole = new List<SelectListItem>();
            foreach (var item in roles)
            {
                tablRole.Add(new SelectListItem { Text = item, Value = item });
            }

            List<SelectListItem> tablUser = new List<SelectListItem>();
            foreach (var item2 in user)
            {
                tablUser.Add(new SelectListItem { Text = item2, Value = item2 });
            }

            RoleAddModels model = new RoleAddModels();
            model.RolesName = tablRole;
            model.UsersName = tablUser;
      
            return View(model);
        }

        //
        // POST : /Roles/AddUser/
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult AddUser(string UserName, string RoleName)
        {
            try
            {
                Roles.AddUserToRole(UserName, RoleName);
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("AddUser");
            }
        }

        //
        // GET : /Roles/DeleteUser
        [Authorize(Roles = "Administrateur")]
        public ActionResult DeleteUser(RolesWithUserModels model)
        {
            return View(model);
        }

        //
        // POST : /Roles/DeleteUser/5
        [Authorize(Roles = "Administrateur")]
        [HttpPost]
        public ActionResult DeleteUser2(RolesWithUserModels model)
        {
            try
            {
                Roles.RemoveUserFromRole(model.UserName, model.RoleName);

                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("DeleteUser",model);
            }
            
        }

       
        

        
    }
}
